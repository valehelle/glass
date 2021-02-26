defmodule Glass.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :description, :string
      add :blog_id, references(:blogs, on_delete: :delete_all)

      timestamps()
    end

    create index(:tags, [:blog_id])
  end
end
