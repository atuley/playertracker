defmodule PlayerTrackerWeb.SearchForPlayerTest do
  use Playertracker.FeatureCase

  hound_session()

  test "Search for a player" do
    navigate_to("/")
    :timer.sleep(5000)
    fill_field({:class, "qa-search"}, "ste")
    
    assert inner_text({:class, "qa-result-201939"}) =~ "Stephen Curry"
  end
end