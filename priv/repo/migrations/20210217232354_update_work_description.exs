defmodule Glass.Repo.Migrations.UpdateWorkDescription do
  use Ecto.Migration

  def change do
    alter table(:works) do
      modify :description, :text
    end
  end
end
