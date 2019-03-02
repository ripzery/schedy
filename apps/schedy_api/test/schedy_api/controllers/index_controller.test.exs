defmodule SchedyAPI.IndexControllerTest do
  use SchedyAPI.ConnCase
  import SchedyAPI.ConnCase

  test "GET /api/" do
    body = get_request("/api/")
    assert body == %{"status" => "ok"}
  end
end
