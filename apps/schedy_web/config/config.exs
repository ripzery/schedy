# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :schedy_web,
  namespace: SchedyWeb,
  ecto_repos: [Schedy.Repo]

# Configures the endpoint
config :schedy_web, SchedyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V3OoyjxKeiCaQ/eeCVd7EOcxvR4T7KfHgAkv/p0Ky9clpnqg6oNHW/oAz3BNUYOp",
  render_errors: [view: SchedyWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SchedyWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :schedy_web, :generators,
  context_app: :schedy

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
