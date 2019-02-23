defmodule Schedy.Application do
  @moduledoc """
  The Schedy Application Service.

  The schedy system business domain lives in this application.

  Exposes API to clients such as the `SchedyWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Schedy.Repo, []),
    ], strategy: :one_for_one, name: Schedy.Supervisor)
  end
end
