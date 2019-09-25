use Mix.Config

# Configure your database
config :playertracker, Playertracker.Repo,
  username: "postgres",
  password: "postgres",
  database: "playertracker_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :playertracker, PlayertrackerWeb.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn
