defmodule Glass.Profile.Work do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Profile.Highlight

  schema "works" do
    field :description, :string
    field :end_date, :utc_datetime
    field :location, :string
    field :name, :string
    field :position, :string
    field :start_date, :utc_datetime
    field :summary, :string
    field :url, :string
    belongs_to :user, User
    has_many :highlights, Highlight

    timestamps()
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:name, :location, :description, :position, :url, :start_date, :end_date, :summary])
    |> validate_required([:name, :location, :description, :position, :url, :start_date, :end_date, :summary])
  end
end
