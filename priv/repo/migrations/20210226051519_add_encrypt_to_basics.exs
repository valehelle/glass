defmodule Glass.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    alter table(:basics) do
      add :encrypt_name, :binary
      add :encrypt_label, :binary
      add :encrypt_phone, :binary
      add :encrypt_summary, :binary
      add :encrypt_loc_address, :binary
      add :encrypt_loc_postal_code, :binary
      add :encrypt_loc_city, :binary
      add :encrypt_loc_country_code, :binary
      add :encrypt_loc_region, :binary

    end

  end
end
