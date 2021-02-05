defmodule Glass.Profile.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User
  alias Glass.Profile.Keyword

  schema "projects" do
    field :description, :string
    field :end_date, :utc_datetime
    field :entity, :string
    field :highlights, :string
    field :name, :string
    field :roles, :string
    field :start_date, :utc_datetime
    field :type, :string
    field :url, :string
    has_many :keywords, Keyword
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :highlights, :start_date, :end_date, :url, :roles, :entity, :type])
    |> validate_required([:name, :description, :highlights, :start_date, :end_date, :url, :roles, :entity, :type])
  end
end
