defmodule PlayerTrackerWeb.CreateAccountTest do
  use Playertracker.FeatureCase

  hound_session()

  test "Create an account" do
    navigate_to("/users/new")
    fill_field({:class, "qa-email"}, "alex@example.com")
    fill_field({:class, "qa-password"}, "password")
    submit_element({:class, "qa-submit"})
    assert inner_text({:class, "alert-info"}) == "User created successfully."
  end
end
