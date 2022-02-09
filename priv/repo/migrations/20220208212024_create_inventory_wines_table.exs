defmodule WineOInventoryApi.Repo.Migrations.CreateInventoryWinesTable do
  use Ecto.Migration

  def change do
    create table(:inventory_wines, primary_key: false) do
      add :inventory_id, references(:inventories, on_delete: :delete_all), null: false
      add :wine_id, references(:wines, on_delete: :delete_all), null: false
    end

    create index(:inventory_wines, [:inventory_id, :wine_id])
  end
end
