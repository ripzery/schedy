defmodule Schedy.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedule" do
    field :end, :string
    field :start, :string

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end])
  end
end
