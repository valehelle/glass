defmodule Glass.Profile.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User

  schema "skills" do
    field :level, :integer
    field :name, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(skill, attrs, user) do
    skill
    |> cast(attrs, [:name, :level])
    |> put_assoc(:user, user)
    |> validate_required([:name, :level])
  end
end
