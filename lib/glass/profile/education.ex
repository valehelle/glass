defmodule Glass.Profile.Education do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User

  schema "educations" do
    field :area, :string
    field :courses, :string
    field :end_date, :date
    field :institution, :string
    field :score, :string
    field :start_date, :date
    field :study_type, :string
    field :url, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(education, attrs, user) do
    education
    |> cast(attrs, [:institution, :url, :area, :study_type, :start_date, :end_date, :score, :courses])
    |> put_assoc(:user, user)
  end
end
