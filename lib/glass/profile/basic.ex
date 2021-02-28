defmodule Glass.Profile.Basic do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User
  schema "basics" do
    field :dev_username, :string, default: ""
    field :email, :string, default: ""
    field :github_usename, :string, default: ""
    field :image, :string, default: ""
    field :label, :string, default: ""
    field :loc_address, :string, default: ""
    field :loc_city, :string, default: ""
    field :loc_country_code, :string, default: ""
    field :loc_postal_code, :string, default: ""
    field :loc_region, :string, default: ""
    field :name, :string, default: ""
    field :phone, :string, default: ""
    field :summary, :string, default: ""
    field :twitter_username, :string, default: ""
    field :url, :string, default: ""
    field :encrypt_name, Glass.Encrypted.Binary
    field :encrypt_label, Glass.Encrypted.Binary
    field :encrypt_phone, Glass.Encrypted.Binary
    field :encrypt_summary, Glass.Encrypted.Binary
    field :encrypt_loc_address, Glass.Encrypted.Binary
    field :encrypt_loc_postal_code, Glass.Encrypted.Binary
    field :encrypt_loc_city, Glass.Encrypted.Binary
    field :encrypt_loc_country_code, Glass.Encrypted.Binary
    field :encrypt_loc_region, Glass.Encrypted.Binary
    belongs_to :user, User


    timestamps()
  end

  def social_username_changeset(basic, attrs) do
    basic
    |> cast(attrs, [:dev_username, :github_usename])
  end


  @doc false
  def changeset(basic, attrs) do
    basic
    |> cast(attrs, [:name, :label, :image, :email, :phone, :url, :summary, :loc_address, :loc_postal_code, :loc_city, :loc_country_code, :loc_region, :twitter_username, :dev_username, :github_usename])
    |> put_encrypted_fields()
  end

  defp put_encrypted_fields(changeset) do
     IO.inspect changeset
      |> put_change(:encrypt_name, get_field(changeset, :name))
      |> put_change(:encrypt_label, get_field(changeset, :label))
      |> put_change(:encrypt_phone, get_field(changeset, :phone))
      |> put_change(:encrypt_summary, get_field(changeset, :summary))
      |> put_change(:encrypt_loc_address, get_field(changeset, :loc_address))  
      |> put_change(:encrypt_loc_postal_code, get_field(changeset, :loc_postal_code))
      |> put_change(:encrypt_loc_city, get_field(changeset, :loc_city))
      |> put_change(:encrypt_loc_country_code, get_field(changeset, :loc_country_code))
      |> put_change(:encrypt_loc_region, get_field(changeset, :loc_region)) 
  end

end
