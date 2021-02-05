defmodule Glass.Profile.Highlight do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Profile.Work


  schema "highlights" do
    field :description, :string
    belongs_to :work, Work

    timestamps()
  end

  @doc false
  def changeset(highlight, attrs) do
    highlight
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
