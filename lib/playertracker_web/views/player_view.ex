defmodule PlayertrackerWeb.PlayerView do
  use PlayertrackerWeb, :view

  def render("players.json", %{data: data}), do: %{players: data}
  def render("stats.json", %{data: data}), do: %{stats: data}
end
