defmodule PlayertrackerWeb.PlayerController do
  use PlayertrackerWeb, :controller
  alias Playertracker.{Accounts, Player}

  def players(conn, _params) do
    mock_players = [
      %{
        id: "2544",
        firstName: "LeBron",
        lastName: "James",
        firstLast: "LeBron James",
        number: "23",
        position: "SF",
        teamId: "1610612747",
        tricode: "LAL",
        teamColor: "#552583",
        followed: false
      },
      %{
        id: "201939",
        firstName: "Stephen",
        lastName: "Curry",
        firstLast: "Stephen Curry",
        number: "30",
        position: "PG",
        teamId: "1610612744",
        tricode: "GSW",
        teamColor: "#1D428A",
        followed: false
      },
      %{
        id: "201142",
        firstName: "Kevin",
        lastName: "Durant",
        firstLast: "Kevin Durant",
        number: "35",
        position: "SF",
        teamId: "1610612756",
        tricode: "PHX",
        teamColor: "#1D1160",
        followed: false
      }
    ]

    render(conn, "players.json", %{data: mock_players})
  end

  def stats(conn, _params) do
    mock_stats = [
      %{
        id: "2544",  # LeBron James
        firstName: "LeBron",
        lastName: "James",
        number: "23",
        position: "SF",
        teamId: "1610612747",  # Lakers
        points: 28,
        assists: 9,
        rebounds: 8,
        steals: 2,
        blocks: 1,
        turnovers: 3,
        minutes: "36:45",
        tricode: "LAL",
        teamColor: "#552583",
        followed: true
      },
      %{
        id: "201939",  # Stephen Curry
        firstName: "Stephen",
        lastName: "Curry",
        number: "30",
        position: "PG",
        teamId: "1610612744",  # Warriors
        points: 32,
        assists: 6,
        rebounds: 5,
        steals: 1,
        blocks: 0,
        turnovers: 2,
        minutes: "34:20",
        tricode: "GSW",
        teamColor: "#1D428A",
        followed: true
      },
      %{
        id: "201142",  # Kevin Durant
        firstName: "Kevin",
        lastName: "Durant",
        number: "35",
        position: "SF",
        teamId: "1610612756",  # Suns
        points: 31,
        assists: 5,
        rebounds: 7,
        steals: 1,
        blocks: 2,
        turnovers: 2,
        minutes: "37:15",
        tricode: "PHX",
        teamColor: "#1D1160",
        followed: false
      }
    ]

    render(conn, "stats.json", %{data: mock_stats})
  end
end
