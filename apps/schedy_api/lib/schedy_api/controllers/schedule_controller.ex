defmodule SchedyAPI.ScheduleController do
  use SchedyAPI, :controller

  def all(conn, attrs) do
    sample = %{
      data: [
        %{
          object: "schedule",
          from: "07:00",
          to: "14:00"
        },
        %{
          object: "schedule",
          from: "08:00",
          to: "20:00"
        },
        %{
          object: "schedule",
          from: "09:00",
          to: "23:00"
        }
      ]
    }

    render(conn, "schedules.json", sample)
  end
end
