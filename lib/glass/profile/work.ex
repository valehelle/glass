defmodule Glass.Profile.Work do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Profile.Highlight
  alias Glass.Accounts.User
  
  schema "works" do
    field :description, :string
    field :end_date, :date
    field :location, :string
    field :name, :string
    field :position, :string
    field :start_date, :date
    field :summary, :string
    field :url, :string
    belongs_to :user, User
    has_many :highlights, Highlight

    timestamps()
  end

  @doc false
  def changeset(work, attrs, user) do
    work
    |> cast(attrs, [:name, :location, :description, :position, :url, :start_date, :end_date, :summary])
    |> put_assoc(:user, user)
  end
end
