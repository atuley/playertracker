defmodule PlayertrackerWeb.PageController do
  use PlayertrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
