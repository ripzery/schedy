defmodule SchedyAPI.ScheduleView do
  use SchedyAPI, :view
  alias SchedyAPI.ScheduleView

  def render("schedules.json", %{data: schedules}) do
    %{
      data: render_many(schedules, ScheduleView, "schedule.json")
    }
  end

  def render("schedule.json", %{schedule: schedule}) do
    schedule
  end

  def render("schedule.add.json", data) do
    %{
      status: "ok",
      id: data.id,
      from: data.from,
      to: data.to
    }
  end

  def render("schedule.delete.json", data) do
    %{
      status: "ok",
      id: data.id,
      from: data.from,
      to: data.to
    }
  end
end
