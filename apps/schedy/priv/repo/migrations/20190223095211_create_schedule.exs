defmodule Schedy.Repo.Migrations.CreateSchedule do
  use Ecto.Migration

  def change do
    create table(:schedule) do
      add :start, :string
      add :end, :string

      timestamps()
    end

  end
end
