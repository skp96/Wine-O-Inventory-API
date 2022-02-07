defmodule WineOInventoryApiWeb.WineViewTest do
    use WineOInventoryApiWeb.ConnCase, async: true

    alias WineOInventoryApiWeb.WineView

    import WineOInventoryApi.ProductsFixtures

    describe "index.json render" do
        test "renders list of all wines" do
            fakeWine = %{id: 1, name: "some fake wine", description: "some fake description", rating: 5, quantity: 100 }
            wines = [fakeWine]
            result_of_render = WineView.render("index.json", wines: wines)
            assert result_of_render != []
        end
    end

    describe "show.json render" do
        test "renders a wine" do
            wine = create_wine_fixture()
            result_of_render = WineView.render("show.json", wine: wine)
            
            assert %{name: "some name", description: "some description", rating: 5, quantity: 10} = result_of_render.data.attributes
        end
    end
end
