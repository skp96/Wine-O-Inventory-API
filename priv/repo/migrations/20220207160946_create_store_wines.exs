defmodule WineOInventoryApi.Repo.Migrations.CreateStoreWines do
  use Ecto.Migration

  def change do
    create table(:store_wines, primary_key: false) do
      add :wine_id, references(:wines), null: false
      add :store_id, references(:stores), null: false
    end

    create index(:store_wines, [:wine_id, :store_id])
  end
end
