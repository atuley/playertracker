defmodule Playertracker.Player do
  alias Playertracker.{Accounts, Repo}
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :first_name, :string
    field :last_name, :string
    field :player_id, :string
    field :number, :string
    field :position, :string
    field :team_color, :string
    field :team_id, :string
    field :tricode, :string

    has_many(:passive_relationships, Playertracker.Accounts.Relationship,
      foreign_key: :followed_id
    )

    has_many(:followers, through: [:passive_relationships, :follower])

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:player_id, :first_name, :last_name])
    |> validate_required([:player_id, :first_name, :last_name])
  end

  def all(current_user) do
    players = Repo.all(Playertracker.Player)

    Enum.reduce(players, [], fn player, acc ->
      trimmed_player = %{
        id: player.player_id,
        firstName: player.first_name,
        lastName: player.last_name,
        firstLast: "#{player.first_name} #{player.last_name}",
        number: player.number,
        position: player.position,
        teamId: player.team_id,
        tricode: player.tricode,
        teamColor: player.team_color,
        followed: Accounts.followed?(current_user, player)
      }

      [trimmed_player | acc]
    end)
  end

  def details(current_user, players) do
    team_info = NbaEx.teams_config()

    Enum.reduce(players, [], fn following, acc ->
      {date, game_id} =
        following
          |> Map.get(:player_id)
          |> last_played_game()
        
      %{"stats" => %{"activePlayers" => boxscore}} = NbaEx.boxscore(date, game_id)

      player = find_stats(boxscore, following.player_id)
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
        teamColor: player_team_info["primaryColor"],
        followed: Accounts.followed?(current_user, following)
      }

      [trimmed_stats | acc]
    end)
  end

  defp last_played_game(player_id) do
    %{"gameDateUTC" => date, "gameId" => game_id} =
      player_id
      |> NbaEx.player_game_log()
      |> List.first()

    {String.replace(date, "-", ""), game_id}
  end

  defp find_team_info(team_info, team_id),
    do: Enum.find(team_info, fn team -> team["teamId"] == team_id end)

  defp find_stats(boxscore, id), do: Enum.find(boxscore, fn stats -> id == stats["personId"] end)
end
