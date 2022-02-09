defmodule WineOInventoryApi.Repo.Migrations.StoreWinesModifyForeignKeys do
  use Ecto.Migration

  def change do
    execute "ALTER TABLE store_wines DROP CONSTRAINT store_wines_wine_id_fkey"
    execute "ALTER TABLE store_wines DROP CONSTRAINT store_wines_store_id_fkey"
    
    alter table("store_wines") do
      modify :wine_id, references(:wines, on_delete: :delete_all), null: false
      modify :store_id, references(:stores, on_delete: :delete_all), null: false
    end
  end
end
