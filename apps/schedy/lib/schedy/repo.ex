defmodule Schedy.Repo do
  use Ecto.Repo,
    otp_app: :schedy,
    adapter: Ecto.Adapters.Postgres
end
