defmodule Glass.Profile.Blog do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User
  alias Glass.Profile.Tag
  schema "blogs" do
    field :description, :string
    field :public_reactions_count, :integer
    field :title, :string
    field :url, :string
    belongs_to :user, User
    has_many :tags, Tag

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :description, :url, :public_reactions_count, :user_id])
    |> validate_required([:title, :description, :url, :public_reactions_count, :user_id])
    |> cast_assoc(:tags, with: &Tag.changeset/2)
  end
end
