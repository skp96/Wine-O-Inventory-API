defmodule WineOInventoryApi.Repo.Migrations.CreateWines do
  use Ecto.Migration

  def change do
    create table(:wines) do
      add :name, :string, null: false
      add :description, :string
      add :rating, :integer
      add :quantity, :integer, default: 0

      timestamps()
    end
  end
end
