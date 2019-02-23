defmodule Schedy.Repo do
  use Ecto.Repo,
    otp_app: :schedy_web,
    adapter: Ecto.Adapters.Postgres
end
