defmodule SchedyAPI.ErrorHandler do
  use SchedyAPI, :controller
  alias SchedyAPI.ErrorView

  @errors %{
    "error:schedule_id_not_found" => %{
      code: "invalid_parameter",
      description: "The given `id` is not found."
    },
    "_" => %{
      code: "unknown_error",
      description: "Unknown error with the request."
    }
  }

  def handle_error(conn, code, key) when is_binary(key) do
    error = Map.get(@errors, key, "_")

    conn
    |> build_error_conn(code)
    |> render_error(error)
  end

  def handle_error(conn, code, changeset) do
    conn
    |> build_error_conn(code)
    |> render_errors(changeset)
  end

  defp build_error_conn(conn, code) do
    conn
    |> put_status(code)
    |> put_view(ErrorView)
  end

  defp render_error(conn, error) do
    render(conn, "error.json", error)
  end

  defp render_errors(conn, changeset) do
    render(conn, "errors.json", changeset)
  end
end
