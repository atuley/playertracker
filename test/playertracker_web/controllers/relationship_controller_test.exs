defmodule PlayertrackerWeb.RelationshipControllerTest do
  use PlayertrackerWeb.ConnCase

  describe "follow player" do
    test "returns success if user hasn't followed them before", %{conn: conn} do
      player = insert(:player)
      user = insert(:user)
      
      resp = Phoenix.ConnTest.build_conn() 
      |> assign(:current_user, user)
      |> post(Routes.relationship_path(conn, :follow), id: player.player_id)

      assert resp.resp_body == "Success"
      assert resp.status == 200
    end
  end
end