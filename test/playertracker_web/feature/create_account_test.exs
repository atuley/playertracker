defmodule PlayerTrackerWeb.CreateAccountTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "Create an account" do
    navigate_to("/user/new")
    fill_field({:class, "qa-email"}, "alex@example.com")
    fill_field({:class, "qa-password"}, "password")
    submit_element({:class, "qa-submit"})
    assert has_class?({:class, "container"}, "qa-success")
  end

end