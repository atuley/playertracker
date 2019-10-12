defmodule PlayerTrackerWeb.SearchForPlayerTest do
  use Playertracker.FeatureCase

  hound_session()

  test "Search for a player" do
    navigate_to("/")
    fill_field({:class, "qa-search"}, "steph")
    
    assert inner_text({:class, "qa-result-201939"}) == "Stephen Curry"
  end
end