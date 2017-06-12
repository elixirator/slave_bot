use Mix.Config

config :slave, Slave.Robot,
  adapter: Hedwig.Adapters.Console,
  name: "slave",
  aka: "/",
  responders: [
    {Hedwig.Responders.Help, []},
    {Hedwig.Responders.Ping, []},
    {Slave.Responders.Notes,  []}
  ]

config :slave, Slave.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "slave_dev",
  username: "slave_app",
  password: "2eYdW8D4",
  hostname: "localhost"
