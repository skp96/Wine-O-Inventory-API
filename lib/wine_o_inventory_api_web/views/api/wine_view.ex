defmodule WineOInventoryApiWeb.WineView do
    use WineOInventoryApiWeb, :view

    def render("index.json", %{wines: wines}) do
        render_many(wines, WineOInventoryApiWeb.WineView, "wine.json")
    end

    def render("show.json", %{wine: wine}) do
        %{
            data: %{
                type: "wines",
                attributes: render_one(wine, WineOInventoryApiWeb.WineView, "wine.json")
            }
        }
    end

    def render("wine.json", %{wine: wine}) do
        %{
            id: wine.id,
            name: wine.name,
            description: wine.description,
            rating: wine.rating,
            quantity: wine.quantity
        }
    end
end
