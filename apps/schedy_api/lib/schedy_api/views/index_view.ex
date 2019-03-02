defmodule SchedyAPI.IndexView do
  use SchedyAPI, :view

  def render("index.json", %{}) do
    %{status: "ok"}
  end
end
