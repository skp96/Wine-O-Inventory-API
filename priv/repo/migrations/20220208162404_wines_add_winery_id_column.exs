defmodule WineOInventoryApi.Repo.Migrations.WinesAddWineryIdColumn do
  use Ecto.Migration

  def change do
    alter table("wines") do
      add :winery_id, references(:wineries)
    end

    create index("wines", [:winery_id])
  end
end
