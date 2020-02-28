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

    # test "handles failure if player id is invalid", %{conn: conn} do
    #   player = insert(:player)
    #   user = insert(:user)
      
    #   new_conn = Phoenix.ConnTest.build_conn() |> assign(:current_user, user)
    #   resp = post(new_conn, Routes.relationship_path(conn, :follow), id: "201")

    #   assert resp.resp_body == "Player not found"
    #   assert resp.status == 400
    # end
  end
end