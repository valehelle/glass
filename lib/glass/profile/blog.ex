defmodule Glass.Profile.Blog do
  use Ecto.Schema
  import Ecto.Changeset
  alias Glass.Accounts.User

  schema "blogs" do
    field :description, :string
    field :public_reactions_count, :integer
    field :title, :string
    field :url, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :description, :url, :public_reactions_count, :user_id])
    |> validate_required([:title, :description, :url, :public_reactions_count, :user_id])
  end
end
