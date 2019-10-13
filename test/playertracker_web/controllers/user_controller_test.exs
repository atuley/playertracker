defmodule PlayertrackerWeb.UserControllerTest do
  use PlayertrackerWeb.ConnCase

  alias Playertracker.Accounts

  @create_attrs %{email: "some email", password: "some password", password_hash: "some password_hash"}
  @invalid_attrs %{email: nil, password: nil, password_hash: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to home page when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)

      assert redirected_to(conn) == Routes.page_path(conn, :index)

      conn = get(conn, Routes.page_path(conn, :index))
      assert html_response(conn, 200) =~ "User created successfully."
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User"
    end
  end
end
