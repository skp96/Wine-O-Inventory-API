defmodule WineOInventoryApi.Repo.Migrations.CreateWineries do
  use Ecto.Migration

  def change do
    create table(:wineries) do
      add :name, :string, null: false
      add :location, :string
      add :phone_number, :string

      timestamps()
    end
  end
end
