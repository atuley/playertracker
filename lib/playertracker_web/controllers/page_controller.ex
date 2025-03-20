defmodule PlayertrackerWeb.PageController do
  use PlayertrackerWeb, :controller
  alias Playertracker.Accounts.User

  def index(conn, _params) do
    mock_user = %User{
      id: 1,
      email: "test@example.com",
      password_hash: "fake_hash",
      inserted_at: ~N[2024-03-20 00:00:00],
      updated_at: ~N[2024-03-20 00:00:00]
    }

    conn
    |> assign(:current_user, mock_user)
    |> render("index.html")
  end
end
