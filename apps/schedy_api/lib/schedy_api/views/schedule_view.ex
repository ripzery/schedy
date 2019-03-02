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

  def render("schedule.add.json", _) do
    %{
      status: "ok"
    }
  end
end
