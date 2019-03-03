defmodule SchedyAPI.IndexView do
  use SchedyAPI, :view

  def render("index.json", %{}) do
    %{status: "ok", description: "I'm fine thank you."}
  end
end
