defmodule Glass.Repo.Migrations.CreateWorks do
  use Ecto.Migration

  def change do
    create table(:works) do
      add :name, :string
      add :location, :string
      add :description, :string
      add :position, :string
      add :url, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime
      add :summary, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:works, [:user_id])
  end
end
