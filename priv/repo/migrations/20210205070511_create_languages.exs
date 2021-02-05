defmodule Glass.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :name, :string
      add :fluency, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:languages, [:user_id])
  end
end
