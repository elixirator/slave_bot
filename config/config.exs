# TODO: Figure out how to deal with sensetive data

use Mix.Config

config :slave, ecto_repos: [Slave.Repo]

import_config "#{Mix.env}.exs"
