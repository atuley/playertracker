defmodule PlayerTrackerWeb.SearchForPlayerTest do
  use Playertracker.FeatureCase

  hound_session()
  setup do
    insert(:player, first_name: "Stephen", last_name: "Curry", player_id: "201939")
    insert(:player)
    :ok 
  end

  test "Search for a player" do
    navigate_to("/")
    :timer.sleep(3000)
    fill_field({:class, "qa-search"}, "ste")
    
    assert inner_text({:class, "qa-result-201939"}) =~ "Stephen Curry"
  end
end