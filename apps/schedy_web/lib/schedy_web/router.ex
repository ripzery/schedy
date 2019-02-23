defmodule SchedyWeb.Router do
  use SchedyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SchedyWeb do
    pipe_through :api
  end
end
