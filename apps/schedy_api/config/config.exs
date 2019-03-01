# Since configuration is shared in umbrella projects, this file
# should only configure the :schedy_api application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :schedy_api, Schedy.Repo,
  database: "schedy_api_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

# General application configuration
config :schedy_api,
  ecto_repos: [Schedy.Repo],
  generators: [context_app: :schedy]

# Configures the endpoint
config :schedy_api, SchedyAPI.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "e0/O20O7fbY8v9YuCIJuBQEpHwTf9QfCiS4zHotr65dvbsrcwcY94LmD5/b5Ahcl",
  render_errors: [view: SchedyAPI.ErrorView, accepts: ~w(json)],
  pubsub: [name: SchedyAPI.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
