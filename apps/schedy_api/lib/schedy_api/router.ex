defmodule SchedyAPI.Router do
  use SchedyAPI, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SchedyAPI do
    pipe_through :api

    get "/", ScheduleController, :index
    get "/:page", ScheduleController, :index
  end
end
