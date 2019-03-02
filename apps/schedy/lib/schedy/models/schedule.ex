defmodule Schedy.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedule" do
    field :from, :string
    field :to, :string

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:from, :to])
    |> validate_required([:from, :to])
  end
end
