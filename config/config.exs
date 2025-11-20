import Config

config :simple_ecto_app, SimpleEctoApp.Repo,
  username: "postgres",
  password: "sliman",
  database: "simple_ecto_db",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :simple_ecto_app,
  ecto_repos: [SimpleEctoApp.Repo]
