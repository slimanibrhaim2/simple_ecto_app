import Config

config :simple_ecto_app, SimpleEctoApp.Repo,
  database: "simple_ecto_db",
  username: "postgres",
  password: "sliman",
  hostname: "localhost",
  pool_size: 10

config :simple_ecto_app,
  ecto_repos: [SimpleEctoApp.Repo]
