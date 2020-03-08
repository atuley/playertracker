defmodule PlayerTrackerWeb.FollowAPlayerTest do
  use Playertracker.FeatureCase

  hound_session()

  setup do
    user = insert(:user, password: "password")
    insert(:player, first_name: "Stephen", last_name: "Curry", player_id: "201939")
    insert(:player)
    {:ok, %{user: user}}
  end

  test "Follow a player", %{user: user} do
    navigate_to("/sessions/new")
    click({:css, ".qa-sign-in"})
    :timer.sleep(3000)
    fill_field({:css, ".qa-session-email"}, user.email)
    fill_field({:css, ".qa-session-password"}, "password")
    click({:css, ".qa-session-submit"})

    :timer.sleep(3000)
    fill_field({:class, "qa-search"}, "ste")

    click({:css, ".qa-follow-201939"})
    assert inner_text({:class, "qa-unfollow-201939"}) =~ "Unfollow"
  end

  test "Unfollow a player", %{user: user} do
    navigate_to("/sessions/new")
    click({:css, ".qa-sign-in"})
    :timer.sleep(3000)
    fill_field({:css, ".qa-session-email"}, user.email)
    fill_field({:css, ".qa-session-password"}, "password")
    click({:css, ".qa-session-submit"})

    :timer.sleep(3000)
    fill_field({:class, "qa-search"}, "ste")

    click({:css, ".qa-follow-201939"})
    :timer.sleep(3000)
    click({:css, ".qa-unfollow-201939"})
    assert inner_text({:class, "qa-follow-201939"}) =~ "Follow"
  end
end
