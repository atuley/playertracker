defmodule PlayerTrackerWeb.FollowAPlayerTest do
  use Playertracker.FeatureCase

  hound_session()

  setup do
    user = insert(:user, password: "password")

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