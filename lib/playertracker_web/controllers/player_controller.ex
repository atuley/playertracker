defmodule PlayertrackerWeb.PlayerController do
  use PlayertrackerWeb, :controller
  alias Playertracker.{Accounts, Player}

  def players(conn, _params) do
    render(conn, "players.json", %{data: Player.all(conn.assigns.current_user)})
  end

  def stats(conn, _params) do
    current_user = conn.assigns.current_user
    following = Accounts.following(current_user)
    render(conn, "stats.json", %{data: Player.details(following)})
  end
end
