# Since configuration is shared in umbrella projects, this file
# should only configure the :schedy application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :schedy, Schedy.Repo,
  username: "ripzery",
  password: "rabarip1",
  database: "schedy_dev",
  hostname: "localhost",
  pool_size: 10
