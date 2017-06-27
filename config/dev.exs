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
