defmodule PlayertrackerWeb.SessionController do
  use PlayertrackerWeb, :controller
  import Plug.Conn

  alias Playertracker.Guardian
  alias Playertracker.Accounts

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, session_params) do
    with {:ok, user} <- Accounts.verify_login(session_params) do
      conn
      |> Guardian.Plug.sign_in(user)
      |> put_flash(:info, "Login successful!")
      |> put_status(302)
      |> redirect(to: Routes.page_path(conn, :index))
    else
      {:error, msg} ->
        conn
        |> put_flash(:error, msg)
        |> put_status(401)
        |> render("new.html")
    end
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> put_flash(:info, "Logout successful!")
    |> put_status(302)
    |> redirect(to: "/")
  end 
end