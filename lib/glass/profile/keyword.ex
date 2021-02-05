defmodule Glass.Profile.Keyword do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Profile.Project

  schema "keywords" do
    field :description, :string
    belongs_to :project, Project
    timestamps()
  end

  @doc false
  def changeset(keyword, attrs) do
    keyword
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
