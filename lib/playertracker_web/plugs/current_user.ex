defmodule PlayertrackerWeb.Plugs.CurrentUser do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _opts) do
    if conn.assigns[:current_user] do
      conn
    else
      conn
      |> assign(:current_user, Guardian.Plug.current_resource(conn))  
    end
  end
end