defmodule Glass.Repo.Migrations.CreateEducations do
  use Ecto.Migration

  def change do
    create table(:educations) do
      add :institution, :string
      add :url, :string
      add :area, :string
      add :study_type, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime
      add :score, :string
      add :courses, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:educations, [:user_id])
  end
end
