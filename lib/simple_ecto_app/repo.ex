defmodule SimpleEctoApp.Repo do
  use Ecto.Repo,
    otp_app: :simple_ecto_app,
    adapter: Ecto.Adapters.Postgres
end
