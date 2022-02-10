# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WineOInventoryApi.Repo.insert!(%WineOInventoryApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias WineOInventoryApi.Products.Wine
alias WineOInventoryApi.Repo
alias WineOInventoryApi.Inventories.Inventory
import Ecto.Changeset

inventories = Repo.all(Inventory)

wine_1 = %{
    name: "Josh Cellars",
    description: "Josh Cellars is a Californian Cabernet Sauvignon",
    quantity: 3,
    rating: 4,
    stores: [%{name: "Josh's Wine Store", location: "NYC"}, %{name: "Cellar's Wine Store"}],
    winery: %{name: "Josh Cellars"}
}
Wine.changeset(%Wine{}, wine_1)
|> put_assoc(:inventories, [Enum.at(inventories, 0), Enum.at(inventories, 1)])
|> Repo.insert!()

wine_2 = %{
    name: "Bodega Norton",
    description: "Bodega Norton is an Argentinian Malbec",
    quantity: 1,
    rating: 3,
    stores: [%{name: "Bodega's Wine Store"}, %{name: "Norton's Wine Store"}],
    winery: %{name: "Bodega Norton"}
}
Wine.changeset(%Wine{}, wine_2)
|> put_assoc(:inventories, [Enum.at(inventories, 2), Enum.at(inventories, 3)])
|> Repo.insert!()

wine_3 = %{
    name: "Veuve Clicquot",
    description: "Veuve Clicquot is a French Brut Champagne",
    quantity: 5,
    rating: 5,
    stores: [%{name: "Veuve's Wine Store"}],
    winery: %{name: "Veuve Clicquot"}
}
Wine.changeset(%Wine{}, wine_3)
|> put_assoc(:inventories, [Enum.at(inventories, 2), Enum.at(inventories, 0)])
|> Repo.insert!()

wine_4 = %{
    name: "Bartenura",
    description: "Bartenura is an Italian Moscato",
    quantity: 2,
    rating: 4,
    winery: %{name: "Bartenura"}
}
Wine.changeset(%Wine{}, wine_4)
|> put_assoc(:inventories, [Enum.at(inventories, 1)])
|> Repo.insert!()

wine_5 = %{
    name: "Santa Margherita",
    description: "Santa Margherita is an Italian Pinot Grigio",
    quantity: 10,
    rating: 3,
    stores: [%{name: "Santa's Wine Store"}]
}
Wine.changeset(%Wine{}, wine_5)
|> put_assoc(:inventories, [Enum.at(inventories, 0), Enum.at(inventories, 1), Enum.at(inventories, 2), Enum.at(inventories, 3)])
|> Repo.insert!()

