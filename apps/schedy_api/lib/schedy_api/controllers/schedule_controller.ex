defmodule SchedyAPI.ScheduleController do
  use SchedyAPI, :controller

  def all(conn, attrs) do
  end

  def create(conn, attrs) do
  end

  def index(conn, _) do
    render(conn, "index.json", %{})
  end
end
