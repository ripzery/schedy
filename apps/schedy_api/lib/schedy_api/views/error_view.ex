defmodule SchedyAPI.ErrorView do
  use SchedyAPI, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".

  def render("error.json", %{code: code, description: description}) do
    %{
      status: "wtf",
      error: %{
        code: code,
        description: description
      }
    }
  end

  def render("error.json", _) do
    %{
      status: "wtf",
      error: %{
        code: "unknown_error",
        description: "Unknown error with the request"
      }
    }
  end

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

end
