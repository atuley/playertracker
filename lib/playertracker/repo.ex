defmodule Playertracker.Repo do
  use Ecto.Repo,
    otp_app: :playertracker,
    adapter: Ecto.Adapters.Postgres
end
