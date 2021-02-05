defmodule Glass.Repo.Migrations.CreateHighlights do
  use Ecto.Migration

  def change do
    create table(:highlights) do
      add :description, :text
      add :work_id, references(:works, on_delete: :nothing)

      timestamps()
    end

    create index(:highlights, [:work_id])
  end
end
