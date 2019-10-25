defmodule Playertracker.Accounts.Relationship do
  use Ecto.Schema
  import Ecto.Changeset

  schema "relationships" do
    belongs_to(:follower, Playertracker.Accounts.User)
    belongs_to(:followed, Playertracker.Player)

    timestamps()
  end

  @doc false
  def changeset(relationship, attrs) do
    relationship
    |> cast(attrs, [:follower_id, :followed_id])
    |> validate_required([:follower_id, :followed_id])
    |> foreign_key_constraint(:follower_id)
    |> foreign_key_constraint(:followed_id)
  end
end
