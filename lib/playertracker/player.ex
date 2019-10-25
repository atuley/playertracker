defmodule Playertracker.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :first_name, :string
    field :last_name, :string
    field :player_id, :string
    has_many(:passive_relationships, Playertracker.Accounts.Relationship, foreign_key: :followed_id)
    has_many(:followers, through: [:passive_relationships, :follower])

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:player_id, :first_name, :last_name])
    |> validate_required([:player_id, :first_name, :last_name])
  end

  def all() do
    fetch_all_players()
    |> filter_out_non_franchise_players()
    |> trim_player_payload()
  end

  def details(ids) do
    team_info = fetch_team_info()

    Enum.reduce(ids, [], fn id, acc ->
      player =
        id
        |> last_played_game()
        |> fetch_boxscore()
        |> find_stats(id)

      player_team_info = find_team_info(team_info, player["teamId"])

      trimmed_stats = %{
        id: player["personId"],
        firstName: player["firstName"],
        lastName: player["lastName"],
        number: player["jersey"],
        position: player["pos"],
        teamId: player["teamId"],
        points: player["points"],
        assists: player["assists"],
        rebounds: player["totReb"],
        steals: player["steals"],
        blocks: player["blocks"],
        turnovers: player["turnovers"],
        minutes: player["min"],
        tricode: player_team_info["tricode"],
        teamColor: player_team_info["primaryColor"]
      }

      [trimmed_stats | acc]
    end)
  end

  defp fetch_boxscore({date, game_id}) do
    %{"stats" => %{"activePlayers" => boxscore}} =
      HTTPoison.get!("http://data.nba.net/prod/v1/#{date}/#{game_id}_boxscore.json")
      |> Map.get(:body)
      |> Jason.decode!()

    boxscore
  end

  defp fetch_all_players() do
    %{"league" => %{"standard" => players}} =
      HTTPoison.get!("http://data.nba.net/prod/v1/2019/players.json")
      |> Map.get(:body)
      |> Jason.decode!()

    players
  end

  defp fetch_team_info() do
    %{"teams" => %{"config" => team_info}} =
      HTTPoison.get!("http://data.nba.net/prod/2019/teams_config.json")
      |> Map.get(:body)
      |> Jason.decode!()

    team_info
  end

  defp fetch_gamelog(player_id) do
    %{"league" => %{"standard" => recent_games}} =
      HTTPoison.get!("http://data.nba.net/prod/v1/2018/players/#{player_id}_gamelog.json")
      |> Map.get(:body)
      |> Jason.decode!()

    recent_games
  end

  defp last_played_game(player_id) do
    %{"gameDateUTC" => date, "gameId" => game_id} =
      player_id
      |> fetch_gamelog()
      |> List.first()

    {String.replace(date, "-", ""), game_id}
  end

  defp trim_player_payload(payload) do
    team_info = fetch_team_info()

    payload
    |> Enum.reduce([], fn player, acc ->
      player_team_info = team_info |> find_team_info(player["teamId"])

      trimmed_player = %{
        id: player["personId"],
        firstName: player["firstName"],
        lastName: player["lastName"],
        number: player["jersey"],
        position: player["pos"],
        teamId: player["teamId"],
        tricode: player_team_info["tricode"],
        teamColor: player_team_info["primaryColor"]
      }

      [trimmed_player | acc]
    end)
  end

  defp find_team_info(team_info, team_id),
    do: Enum.find(team_info, fn team -> team["teamId"] == team_id end)

  defp find_stats(boxscore, id), do: Enum.find(boxscore, fn stats -> id == stats["personId"] end)

  defp filter_out_non_franchise_players(players),
    do: Enum.filter(players, fn player -> player["teamId"] != "" && player["jersey"] != "" end)
end
