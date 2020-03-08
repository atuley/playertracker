defmodule PlayertrackerWeb.PlayerControllerTest do
  use PlayertrackerWeb.ConnCase

  test "GET /api/players", %{conn: conn} do
    conn = get(conn, "/api/players")
    assert json_response(conn, 200)
  end

  test "GET /api/stats" do
    player = insert(:player)
    user = insert(:user)
    insert(:relationship, follower_id: user.id, followed_id: player.id)


    conn = Phoenix.ConnTest.build_conn()
    |> assign(:current_user, user)
    |> get("/api/stats")

    assert json_response(conn, 200)
  end
end
