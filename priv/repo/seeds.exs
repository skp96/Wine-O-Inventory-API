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

Repo.insert! %Wine{
    name: "Josh Cellars",
    description: "Josh Cellars is a Californian Cabernet Sauvignon",
    quantity: 3,
    rating: 4
}

Repo.insert! %Wine{
    name: "Bodega Norton",
    description: "Bodega Norton is an Argentinian Malbec",
    quantity: 1,
    rating: 3
}

Repo.insert! %Wine{
    name: "Veuve Clicquot",
    description: "Veuve Clicquot is a French Brut Champagne",
    quantity: 5,
    rating: 5
}

Repo.insert! %Wine {
    name: "Bartenura",
    description: "Bartenura is an Italian Moscato",
    quantity: 2,
    rating: 4
}

Repo.insert! %Wine {
    name: "Santa Margherita",
    description: "Santa Margherita is an Italian Pinot Grigio",
    quantity: 10,
    rating: 3
}

