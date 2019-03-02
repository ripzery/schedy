defmodule Schedy.Repo.Migrations.UpdateSchedule do
  use Ecto.Migration

  def change do
    rename(table(:schedule), :start, to: :from)
    rename(table(:schedule), :end, to: :to)
  end
end
