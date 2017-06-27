use Mix.Config

config :slave, Slave.Robot,
  adapter: Hedwig.Adapters.Slack,
  name: "slave",
  aka: "@",
  token: System.get_env("SLACK_TOKEN"),
  rooms: [],
  responders: [
    {Hedwig.Responders.Help, []},
    {Hedwig.Responders.Ping, []},
    {Slave.Responders.Notes,  []}
  ]

config :slave, Slave.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "slave_prod",
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASS"),
  hostname: System.get_env("DB_HOSTNAME")
