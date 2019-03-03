defmodule SchedyAPI.ScheduleControllerTest do
  use SchedyAPI.ConnCase
  import SchedyAPI.ConnCase

  test "GET /api/schedule.get" do
    response = post_request("/api/schedule.add", %{from: "07:00", to: "14:00"})
    %{"id" => id} = response["data"]["data"]

    body = get_request("/api/schedule.get?id=#{id}")

    assert body["data"]["data"]["id"] == id
    assert body["status"] == "ok"
  end

  test "GET /api/schedule.all" do
    post_request("/api/schedule.add", %{from: "07:00", to: "14:00"})
    post_request("/api/schedule.add", %{from: "08:00", to: "20:00"})
    post_request("/api/schedule.add", %{from: "09:00", to: "23:00"})

    body = get_request("/api/schedule.all")

    expected_data = [
      %{"from" => "07:00", "object" => "schedule", "to" => "14:00"},
      %{"from" => "08:00", "object" => "schedule", "to" => "20:00"},
      %{"from" => "09:00", "object" => "schedule", "to" => "23:00"}
    ]

    data =
      Enum.map(body["data"]["data"], fn schedule -> Map.drop(schedule, ["inserted_at", "id"]) end)

    assert body["status"] == "ok"
    assert data == expected_data
  end

  test "POST /api/schedule.add" do
    response = post_request("/api/schedule.add", %{from: "07:00", to: "14:00"})
    assert response["status"] == "ok"
    assert %{"from" => "07:00", "to" => "14:00"} = response["data"]["data"]
  end

  test "POST /api/schedule.delete" do
    %{"data" => data} = post_request("/api/schedule.add", %{from: "07:00", to: "14:00"})
    id = data["data"]["id"]

    response = post_request("/api/schedule.delete", %{id: id})

    assert response["status"] == "ok"
  end
end
