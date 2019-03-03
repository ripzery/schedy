defmodule Schedy.Schedule do
  use Ecto.Schema
  alias Schedy.Repo
  alias Schedy.Schedule
  import Ecto.Changeset
  import Ecto.Query

  @error %{
    format: "Invalid format. The valid format should be from 00:00 to 23:59."
  }

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
    |> validate_format(:from, ~r/^([0-1][0-9]|[2][0-3]):([0-5][0-9])$/, [message: @error.format])
    |> validate_format(:to, ~r/^([0-1][0-9]|[2][0-3]):([0-5][0-9])$/, [message: @error.format])
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

  def add(attrs) do
    case changeset(%Schedule{}, attrs) do
      {:error, _} = changeset -> {:error, changeset}
      cs -> Repo.insert(cs)
    end
  end

  def delete(id) do
    get(id)
    |> Repo.delete()
  end
end
