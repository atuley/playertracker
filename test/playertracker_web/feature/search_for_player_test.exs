defmodule PlayerTrackerWeb.SearchForPlayerTest do
  use Playertracker.FeatureCase

  hound_session()

  setup do
    insert(:player, first_name: "Stephen", last_name: "Curry", player_id: "201939")
    insert(:player)
    user = insert(:user, password: "password")
    {:ok, %{user: user}}
  end

  test "Search for a player", %{user: user} do
    navigate_to("/")
    click({:css, ".qa-sign-in"})
    :timer.sleep(3000)
    fill_field({:css, ".qa-session-email"}, user.email)
    fill_field({:css, ".qa-session-password"}, "password")
    click({:css, ".qa-session-submit"})

    :timer.sleep(3000)
    fill_field({:class, "qa-search"}, "ste")

    assert inner_text({:class, "qa-result-201939"}) =~ "Stephen Curry"
  end
end
