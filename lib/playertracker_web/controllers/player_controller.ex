defmodule PlayertrackerWeb.PlayerController do
  use PlayertrackerWeb, :controller
  alias Playertracker.Player

  def players(conn, _params) do
    current_user = conn.assigns.current_user

    render(conn, "players.json", %{data: Player.all(current_user)})
  end
end
