defmodule WineOInventoryApiWeb.WineController do
    use WineOInventoryApiWeb, :controller

    alias WineOInventoryApi.Products
    
    def index(conn, _params) do
        wines = Products.list_wines()
        render(conn, "index.json", wines: wines)
    end
end
