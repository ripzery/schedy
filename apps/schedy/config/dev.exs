use Mix.Config

# Configure your database
config :schedy, Schedy.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "schedy_dev",
  hostname: "localhost",
  pool_size: 10
