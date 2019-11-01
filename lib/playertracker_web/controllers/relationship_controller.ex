defmodule PlayertrackerWeb.RelationshipController do
  use PlayertrackerWeb, :controller
  alias Playertracker.{Accounts, Player, Repo}

  def follow(conn, %{"id" => id}) do
    player = Repo.get_by!(Player, player_id: id)
    current_user = conn.assigns.current_user
    Accounts.follow(player, current_user)

    conn
    |> put_flash(:info, "User followed.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
