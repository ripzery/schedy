defmodule Schedy.Repo do
  use Ecto.Repo,
    otp_app: :schedy_api,
    adapter: Ecto.Adapters.Postgres
end
