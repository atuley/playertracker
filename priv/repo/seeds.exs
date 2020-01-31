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

alias Playertracker.{Repo, Player}

IO.puts "Seeding players..."
raw_players = Player.all()

Enum.each(raw_players, fn player -> 
  %Player{first_name: player.firstName, last_name: player.lastName, player_id: player.id}
  |> Repo.insert!()
end)

