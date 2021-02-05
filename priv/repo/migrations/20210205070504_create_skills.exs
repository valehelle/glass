defmodule Glass.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :level, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:skills, [:user_id])
  end
end
