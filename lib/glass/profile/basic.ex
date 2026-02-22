defmodule Glass.Profile.Basic do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User
  schema "basics" do
    field :dev_username, :string, default: ""
    field :email, :string, default: ""
    field :github_usename, :string, default: ""
    field :image, :string, default: ""
    field :label, Glass.Encrypted.Binary
    field :loc_address, Glass.Encrypted.Binary
    field :loc_city, Glass.Encrypted.Binary
    field :loc_country_code, Glass.Encrypted.Binary
    field :loc_postal_code, Glass.Encrypted.Binary
    field :loc_region, Glass.Encrypted.Binary
    field :name, Glass.Encrypted.Binary
    field :phone, Glass.Encrypted.Binary
    field :summary, Glass.Encrypted.Binary
    field :twitter_username, :string, default: ""
    field :url, :string, default: ""
    
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
  end


end
