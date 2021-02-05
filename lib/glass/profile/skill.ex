defmodule Glass.Profile.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User

  schema "skills" do
    field :level, :string
    field :name, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
  end
end
