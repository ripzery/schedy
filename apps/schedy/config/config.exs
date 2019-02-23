use Mix.Config

config :schedy, ecto_repos: [Schedy.Repo]

import_config "#{Mix.env}.exs"
