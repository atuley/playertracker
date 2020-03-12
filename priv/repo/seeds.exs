# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Playertracker.Repo.insert!(%Playertracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Playertracker.Seeds do
  def all_seed() do
    fetch_all_players()
    |> filter_out_non_franchise_players()
    |> trim_player_payload()
  end
  
  defp fetch_all_players() do
    %{"league" => %{"standard" => players}} =
      HTTPoison.get!("http://data.nba.net/prod/v1/2019/players.json")
      |> Map.get(:body)
      |> Jason.decode!()
  
    players
  end
  
  defp trim_player_payload(payload) do
    team_info = NbaEx.teams_config()
  
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
  
  defp filter_out_non_franchise_players(players),
    do: Enum.filter(players, fn player -> player["teamId"] != "" && player["jersey"] != "" end)
    
  defp find_team_info(team_info, team_id),
    do: Enum.find(team_info, fn team -> team["teamId"] == team_id end)
end

alias Playertracker.{Player, Repo, Seeds}

IO.puts("Seeding players...")
raw_players = Seeds.all_seed()

Enum.each(raw_players, fn player ->
  %Player{
    first_name: player.firstName,
    last_name: player.lastName,
    player_id: player.id,
    number: player.number,
    position: player.position,
    team_color: player.teamColor,
    team_id: player.teamId,
    tricode: player.tricode
  }
  |> Repo.insert!()
end)
