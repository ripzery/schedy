defmodule SchedyAPI.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use Phoenix.ConnTest
  use ExUnit.CaseTemplate

  @endpoint SchedyAPI.Endpoint

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest
      alias SchedyAPI.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint SchedyAPI.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Schedy.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Schedy.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  def get_request(endpoint, attrs \\ %{}) do
    build_conn()
    |> get(endpoint, attrs)
    |> response(200)
    |> Poison.decode!()
  end

  def post_request(endpoint, attrs \\ %{}) do
    build_conn()
    |> post(endpoint, attrs)
    |> response(200)
    |> Poison.decode!()
  end
end
