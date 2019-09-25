defmodule PlayerTrackerWeb.CreateAccountTest do
  use ExUnit.Case, async: true
  use Hound.Helpers

  hound_session()

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Playertracker.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Playertracker.Repo, {:shared, self()})
  end

  test "Create an account" do
    navigate_to("/users/new")
    fill_field({:class, "qa-email"}, "alex@example.com")
    fill_field({:class, "qa-password"}, "password")
    submit_element({:class, "qa-submit"})
    message = inner_text({:class, "alert-info"})
    assert message == "User created successfully."
  end

end