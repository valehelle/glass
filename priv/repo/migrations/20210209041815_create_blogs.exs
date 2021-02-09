defmodule Glass.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :description, :text
      add :url, :string
      add :public_reactions_count, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:blogs, [:user_id])
  end
end
