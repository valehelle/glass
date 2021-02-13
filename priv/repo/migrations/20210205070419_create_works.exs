defmodule Glass.Repo.Migrations.CreateWorks do
  use Ecto.Migration

  def change do
    create table(:works) do
      add :name, :string
      add :location, :string
      add :description, :string
      add :position, :string
      add :url, :string
      add :start_date, :date
      add :end_date, :date
      add :is_current, :boolean, default: false
      add :summary, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:works, [:user_id])
  end
end
