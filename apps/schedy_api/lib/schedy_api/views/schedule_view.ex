defmodule SchedyAPI.ScheduleView do
  use SchedyAPI, :view
  alias SchedyAPI.ScheduleView

  def render("schedules.json", %{data: schedules}) do
    %{
      status: "ok",
      data: %{
        object: "list",
        data: render_many(schedules, ScheduleView, "schedule.json")
      }
    }
  end

  def render("schedule.get.json", schedule) do
    %{
      status: "ok",
      data: %{
        object: "object",
        data: %{
          id: schedule.id,
          from: schedule.from,
          to: schedule.to,
          inserted_at: schedule.inserted_at
        }
      }
    }
  end

  def render("schedule.json", %{schedule: schedule}) do
    schedule
  end

  def render("schedule.add.json", data) do
    %{
      status: "ok",
      data: %{
        object: "object",
        data: %{
          id: data.id,
          from: data.from,
          to: data.to
        }
      }
    }
  end

  def render("schedule.delete.json", data) do
    %{
      status: "ok",
      data: %{
        object: "object",
        data: %{
          id: data.id,
          from: data.from,
          to: data.to
        }
      }
    }
  end
end
