defmodule SchedyAPI.ScheduleView do
  use SchedyAPI, :view
  alias SchedyAPI.ScheduleView

  def render("schedules.json", %{data: schedules}) do
    IO.inspect schedules
    %{
      data: render_many(schedules, ScheduleView, "schedule.json")
    }
  end

  def render("schedule.json", %{schedule: schedule}) do
    schedule
  end
end
