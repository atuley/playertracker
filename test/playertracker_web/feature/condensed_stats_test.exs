defmodule PlayerTrackerWeb.CondensedStatsTest do
  use Playertracker.FeatureCase

  hound_session()

  test "Should fetch stats for followed players on page load" do
    player = insert(:player)
    user = insert(:user)
    insert(:relationship, follower_id: user.id, followed_id: player.id)
    navigate_to("/sessions/new")
    click({:css, ".qa-sign-in"})
    :timer.sleep(3000)
    fill_field({:css, ".qa-session-email"}, user.email)
    fill_field({:css, ".qa-session-password"}, "password")
    click({:css, ".qa-session-submit"})
    :timer.sleep(3000)
    assert inner_text({:class, "stats__primary"})
  end
end
