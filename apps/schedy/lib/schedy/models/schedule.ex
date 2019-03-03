defmodule Schedy.Schedule do
  use Ecto.Schema
  alias Schedy.Repo
  alias Schedy.Schedule
  import Ecto.Changeset
  import Ecto.Query

  schema "schedule" do
    field(:from, :string)
    field(:to, :string)

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:from, :to])
    |> validate_required([:from, :to])
  end

  def all() do
    Repo.all(
      from(s in Schedule,
        select: %{
          id: s.id,
          from: s.from,
          to: s.to,
          inserted_at: s.inserted_at,
          object: "schedule"
        }
      )
    )
  end

  def get(id) do
    Repo.get(Schedule, id)
  end

  def add(from, to) do
    Repo.insert(%Schedule{from: from, to: to})
  end

  def delete(id) do
    get(id)
    |> Repo.delete()
  end
end
