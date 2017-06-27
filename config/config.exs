use Mix.Config

config :slave, ecto_repos: [Slave.Repo]

config :slave, Slave.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: System.get_env("DB_NAME"),
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASS"),
  hostname: System.get_env("DB_HOSTNAME")

import_config "#{Mix.env}.exs"
