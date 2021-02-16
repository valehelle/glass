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
