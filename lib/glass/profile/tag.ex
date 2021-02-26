defmodule Glass.Profile.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Profile.Blog

  schema "tags" do
    field :description, :string
    belongs_to :blog, Blog
    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
