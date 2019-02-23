use Mix.Config

# Configure your database
config :schedy, Schedy.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "schedy_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
