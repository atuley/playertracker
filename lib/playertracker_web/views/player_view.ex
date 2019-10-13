defmodule PlayertrackerWeb.PlayerView do
  use PlayertrackerWeb, :view

  def render("players.json", %{data: data}), do: %{players: data}
end
