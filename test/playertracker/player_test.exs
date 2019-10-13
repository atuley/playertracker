defmodule Playertracker.PlayerTest do
  use ExUnit.Case, async: false

  alias Playertracker.Player

  describe "all/0" do
    test "should return all franchise NBA players" do
      players = Player.all()
      first_player = players |> List.first()

      assert first_player == %{
               firstName: "Ivica",
               id: "1627826",
               lastName: "Zubac",
               number: "40",
               position: "C",
               teamId: "1610612746",
               teamColor: "#ed174b",
               tricode: "LAC"
             }

      assert players |> length > 0
    end
  end

  describe "details/1" do
    test "should return details for players last played game" do
      details = Player.details(["1627826"])

      assert List.first(details) == %{
               assists: "0",
               blocks: "1",
               firstName: "Ivica",
               id: "1627826",
               lastName: "Zubac",
               minutes: "2:25",
               number: "40",
               points: "0",
               position: "",
               rebounds: "1",
               steals: "0",
               teamId: "1610612746",
               turnovers: "0",
               teamColor: "#ed174b",
               tricode: "LAC"
             }
    end
  end
end
