defmodule SchedyAPI.ScheduleController do
  use SchedyAPI, :controller
  alias Schedy.Repo
  alias Schedy.Schedule
  import Ecto.Query

  def add(conn, %{"from" => from, "to" => to}) do
    {:ok, schedule} = Repo.insert(%Schedule{from: from, to: to})
    render(conn, "schedule.add.json", schedule)
  end

  def delete(conn, %{"id" => id}) do
    {:ok, data} =
      Schedule
      |> Repo.get(id)
      |> Repo.delete()

    render(conn, "schedule.delete.json", data)
  end

  def all(conn, attrs) do
    data =
      Repo.all(
        from(s in Schedule,
          select: %{
            id: s.id,
            from: s.from,
            to: s.to,
            inserted_at: s.inserted_at,
            object: "schedule"
          }
        )
      )

    render(conn, "schedules.json", %{data: data})
  end
end
