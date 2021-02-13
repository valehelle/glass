defmodule Glass.Profile.Language do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User

  schema "languages" do
    field :fluency, :integer
    field :name, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(language, attrs, user) do
    language
    |> cast(attrs, [:name, :fluency])
    |> validate_required([:name, :fluency])
    |> put_assoc(:user, user)
  end
end
