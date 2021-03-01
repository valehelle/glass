defmodule Glass.Repo.Migrations.DeleteOldAndRenameEncrypt do
  use Ecto.Migration

  def change do
    alter table(:basics) do
      remove :name
      remove :label
      remove :phone
      remove :summary
      remove :loc_address
      remove :loc_postal_code
      remove :loc_city
      remove :loc_country_code
      remove :loc_region

    end

    rename table(:basics), :encrypt_name, to: :name
    rename table(:basics), :encrypt_label, to: :label
    rename table(:basics), :encrypt_phone, to: :phone
    rename table(:basics), :encrypt_summary, to: :summary
    rename table(:basics), :encrypt_loc_address, to: :loc_address
    rename table(:basics), :encrypt_loc_postal_code, to: :loc_postal_code
    rename table(:basics), :encrypt_loc_city, to: :loc_city
    rename table(:basics), :encrypt_loc_country_code, to: :loc_country_code
    rename table(:basics), :encrypt_loc_region, to: :loc_region


  end
end

