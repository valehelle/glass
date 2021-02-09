defmodule Glass.Repo.Migrations.CreateKeywords do
  use Ecto.Migration

  def change do
    create table(:keywords) do
      add :description, :text
      add :project_id, references(:projects, on_delete: :delete_all)

      timestamps()
    end

    create index(:keywords, [:project_id])
  end
end
