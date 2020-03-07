defmodule PlayertrackerWeb.RelationshipController do
  use PlayertrackerWeb, :controller
  alias Playertracker.{Accounts, Player, Repo}

  def follow(conn, %{"id" => id}) do
    player = Repo.get_by!(Player, player_id: id)
    current_user = conn.assigns.current_user

    case Accounts.follow(player, current_user) do
      {:ok, _} -> conn
      |> Plug.Conn.resp(200, "Success")
      |> Plug.Conn.send_resp()
      _ -> conn
      |> Plug.Conn.resp(400, "Unable to follow player")
      |> Plug.Conn.send_resp()
    end
  end
end
