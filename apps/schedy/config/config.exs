# Since configuration is shared in umbrella projects, this file
# should only configure the :schedy application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :schedy,
  ecto_repos: [Schedy.Repo]

import_config "#{Mix.env()}.exs"
