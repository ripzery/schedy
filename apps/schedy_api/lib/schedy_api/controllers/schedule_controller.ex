defmodule SchedyAPI.ScheduleController do
  use SchedyAPI, :controller
  alias Schedy.Schedule
  alias SchedyAPI.ErrorHandler

  def get(conn, %{"id" => id}) do
    case Schedule.get(id) do
      nil -> get(conn, nil)
      schedule -> render(conn, "schedule.get.json", schedule)
    end
  end

  def get(conn, _), do: ErrorHandler.handle_error(conn, 400, "error:schedule_id_not_found")

  def add(conn, %{"from" => from, "to" => to}) do
    {:ok, schedule} = Schedule.add(from, to)
    render(conn, "schedule.add.json", schedule)
  end

  def delete(conn, %{"id" => id}) do
    {:ok, data} = Schedule.delete(id)
    render(conn, "schedule.delete.json", data)
  end

  def all(conn, attrs) do
    data = Schedule.all()
    render(conn, "schedules.json", %{data: data})
  end
end
