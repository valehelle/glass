defmodule Glass.Repo.Migrations.CreateBasics do
  use Ecto.Migration

  def change do
    create table(:basics) do
      add :name, :string
      add :label, :string
      add :image, :string
      add :email, :string
      add :phone, :string
      add :url, :string
      add :summary, :text
      add :loc_address, :string
      add :loc_postal_code, :string
      add :loc_city, :string
      add :loc_country_code, :string
      add :loc_region, :string
      add :twitter_username, :string
      add :dev_username, :string
      add :github_usename, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:basics, [:user_id])
  end
end
