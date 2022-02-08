defmodule WineOInventoryApi.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :name, :string, null: false

      timestamps()
    end

    create index(:members, [:name])
  end
end
