defmodule WineOInventoryApi.Repo.Migrations.CreateInventories do
  use Ecto.Migration

  def change do
    create table(:inventories) do
      add :member_id, references(:members), null: false
      timestamps()
    end
  end
end
