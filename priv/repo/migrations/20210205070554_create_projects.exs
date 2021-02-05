defmodule Glass.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :string
      add :highlights, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime
      add :url, :string
      add :roles, :string
      add :entity, :string
      add :type, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:projects, [:user_id])
  end
end
