defmodule Glass.Profile.Education do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User

  schema "educations" do
    field :area, :string
    field :courses, :string
    field :end_date, :utc_datetime
    field :institution, :string
    field :score, :string
    field :start_date, :utc_datetime
    field :study_type, :string
    field :url, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(education, attrs) do
    education
    |> cast(attrs, [:institution, :url, :area, :study_type, :start_date, :end_date, :score, :courses])
    |> validate_required([:institution, :url, :area, :study_type, :start_date, :end_date, :score, :courses])
  end
end
