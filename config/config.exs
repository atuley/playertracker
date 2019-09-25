# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :playertracker,
  ecto_repos: [Playertracker.Repo]

# Configures the endpoint
config :playertracker, PlayertrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZY1F4tVKWEPIZXSjWFVpqBAn2Rgpu2rxe4b4EShT8NukTZrwoDPsG3QSR2pOIOdO",
  render_errors: [view: PlayertrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Playertracker.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :hound,
    browser: "chrome",
    driver: "chrome_driver"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
