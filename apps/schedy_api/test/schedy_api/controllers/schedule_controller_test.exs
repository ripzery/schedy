defmodule SchedyAPI.ScheduleControllerTest do
  use SchedyAPI.ConnCase
  import SchedyAPI.ConnCase

  test "GET /api/schedule.all" do
    # Prepare
    post_request("/api/schedule.add", %{from: "07:00", to: "14:00"})
    post_request("/api/schedule.add", %{from: "08:00", to: "20:00"})
    post_request("/api/schedule.add", %{from: "09:00", to: "23:00"})

    body = get_request("/api/schedule.all")

    expected_data = [
      %{"from" => "07:00", "object" => "schedule", "to" => "14:00"},
      %{"from" => "08:00", "object" => "schedule", "to" => "20:00"},
      %{"from" => "09:00", "object" => "schedule", "to" => "23:00"}
    ]

    data = Enum.map(body["data"], fn schedule -> Map.drop(schedule, ["inserted_at", "id"]) end)

    assert data == expected_data
  end
end
