defmodule SchedyAPI.IndexController do
  use SchedyAPI, :controller

  def index(conn, _) do
    render(conn, "index.json", %{})
  end
end
