defmodule PlayertrackerWeb.RelationshipController do
  use PlayertrackerWeb, :controller

  alias Playertracker.Accounts
  alias Playertracker.Accounts.User
  alias Playertracker.Player
  alias Playertracker.Repo

  def follow(conn, %{"id" => id}) do
    player = Repo.all(Player) |> List.first()
    Accounts.follow(player, conn.assigns.current_user)

    conn
    |> put_flash(:info, "User followed.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
