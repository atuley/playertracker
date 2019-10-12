defmodule PlayertrackerWeb.SignInToAccountTest do
  use Playertracker.FeatureCase

  hound_session()

  setup do
    user = insert(:user, password: "password")

    {:ok, %{user: user}}
  end

  test "logging in with valid user credentials", %{user: user} do
    navigate_to("/")
    click({:css, ".qa-sign-in"})
    fill_field({:css, ".qa-session-email"}, user.email)
    fill_field({:css, ".qa-session-password"}, "password")
    click({:css, ".qa-session-submit"})

    assert current_path() == "/"
    assert String.contains?(page_source(), "Login successful!")
  end

  test "attempting to log in with invalid user credentials", %{user: user} do
    navigate_to("/")
    click({:css, ".qa-sign-in"})
    fill_field({:css, ".qa-session-email"}, user.email)
    fill_field({:css, ".qa-session-password"}, "not the right password")
    click({:css, ".qa-session-submit"})

    refute current_path() == "/"
    assert String.contains?(page_source(), "Invalid email or password!")
  end

  test "can log out", %{user: user} do
    navigate_to("/")
    click({:css, ".qa-sign-in"})
    fill_field({:css, ".qa-session-email"}, user.email)
    fill_field({:css, ".qa-session-password"}, "password")
    click({:css, ".qa-session-submit"})

    assert current_path() == "/"
    click({:css, ".qa-log-out"})
    assert String.contains?(page_source(), "Logout successful!")
  end
end
