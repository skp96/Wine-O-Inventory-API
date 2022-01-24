defmodule WineOInventoryApiWeb.WineViewTest do
    use WineOInventoryApiWeb.ConnCase, async: true
    alias WineOInventoryApiWeb.WineView
    import WineOInventoryApi.ProductsFixtures

    describe "index.json render" do
        test "renders list of all wines" do
            wine = wine_fixture()
            wines = %{wines: [wine]}
            result_of_render = WineView.render("index.json", wines)
            assert result_of_render["wines"] != []
        end
    end
end
