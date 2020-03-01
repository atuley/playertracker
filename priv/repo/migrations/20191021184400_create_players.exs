defmodule Playertracker.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :player_id, :string
      add :first_name, :string
      add :last_name, :string
      add :number, :string
      add :position, :string
      add :team_color, :string
      add :team_id, :string
      add :tricode, :string

      timestamps()
    end
  end
end
