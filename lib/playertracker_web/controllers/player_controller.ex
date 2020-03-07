defmodule PlayertrackerWeb.PlayerController do
  use PlayertrackerWeb, :controller
  alias Playertracker.Player

  def players(conn, _params) do
    render(conn, "players.json", %{data: Player.all(conn.assigns.current_user)})
  end
end
