use Mix.Config

config :slave, Slave.Robot,
  adapter: Hedwig.Adapters.Console,
  name: "slave",
  aka: "/",
  responders: [
    {Hedwig.Responders.Help, []},
    {Hedwig.Responders.Ping, []},
    {Slave.Responders.Dialog, []}
  ]
