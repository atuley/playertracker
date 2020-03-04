defmodule PlayerTrackerWeb.FollowAPlayerTest do
  use Playertracker.FeatureCase

  hound_session()

  setup do
    user = insert(:user, password: "password")
    # Need to sign in
    insert(:player, first_name: "Stephen", last_name: "Curry", player_id: "201939")
    insert(:player)

    {:ok, %{user: user}}
  end

  test "Follow a player", %{user: user} do
    navigate_to("/")
    :timer.sleep(3000)
    fill_field({:class, "qa-search"}, "ste")
    
    click({:css, ".qa-follow-201939"})
    assert inner_text({:class, "qa-following-201939"}) =~ "Stephen Curry"
    assert user.following == ["201939"] 
  end
end