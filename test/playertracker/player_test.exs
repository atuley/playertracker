defmodule Playertracker.PlayerTest do
  use Playertracker.DataCase

  alias Playertracker.Player

  describe "all/0" do
    test "should return list of NBA players" do
      insert(:player)

      players = Player.all("blah")
      first_player = players |> List.first()

      assert is_list(players)

      assert first_player == %{
               firstName: "Kobe",
               id: "1627826",
               lastName: "Bryant",
               firstLast: "Kobe Bryant",
               number: "24",
               position: "G",
               teamId: "1610612746",
               teamColor: "#ed174b",
               tricode: "LAL",
               followed: false
             }

      assert players |> length > 0
    end
  end

  describe "details/1" do
    test "should return details for players last played game" do
      player = insert(:player)
      user = insert(:user)
      details = Player.details(user, [player])

      assert List.first(details) == %{
        assists: "0",
        blocks: "1",
        firstName: "Ivica",
        followed: false,
        id: "1627826",
        lastName: "Zubac",
        minutes: "10:42",
        number: "40",
        points: "6",
        position: "C",
        rebounds: "4",
        steals: "0",
        teamColor: "#ed174b",
        teamId: "1610612746",
        tricode: "LAC",
        turnovers: "1"
      }
    end
  end
end
