defmodule WineOInventoryApi.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :name, :string, null: false
      add :location, :string
      add :phone_number, :string

      timestamps()
    end
  end
end
