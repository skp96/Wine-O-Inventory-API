defmodule WineOInventoryApiWeb.WineController do
    use WineOInventoryApiWeb, :controller

    alias WineOInventoryApi.Products
    
    def index(conn, _params) do
        wines = Products.list_wines()
        render(conn, "index.json", wines: wines)
    end

    def create(conn, %{"data" => wine_params}) do
        wine_attributes = wine_params["attributes"]
        case Products.create_wine(wine_attributes) do
            {:ok, wine} -> 
                conn
                |> put_status(:created)
                |> render("show.json", wine: wine)
            {:error, %Ecto.Changeset{} = changeset} -> 
                conn
                |> put_status(:unprocessable_entity)
                |> put_view(WineOInventoryApiWeb.ErrorView)
                |> render("422.json", changeset: changeset)
        end
    end
end
