defmodule SchedyAPI.ScheduleControllerTest do
  use SchedyAPI.ConnCase
  import SchedyAPI.ConnCase

  test "GET /api/schedule.all" do
    body = get_request("/api/schedule.all")

    expected_data = %{
      "data" => [
        %{"from" => "07:00", "object" => "schedule", "to" => "14:00"},
        %{"from" => "08:00", "object" => "schedule", "to" => "20:00"},
        %{"from" => "09:00", "object" => "schedule", "to" => "23:00"}
      ]
    }

    assert body == expected_data
  end
end
