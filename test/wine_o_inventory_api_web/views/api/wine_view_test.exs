defmodule WineOInventoryApiWeb.WineViewTest do
    use WineOInventoryApiWeb.ConnCase, async: true
    alias WineOInventoryApiWeb.WineView
    import WineOInventoryApi.ProductsFixtures

    describe "index.json render" do
        test "renders list of all wines" do
            wine = wine_fixture()
            wines = %{wines: [wine]}
            result_of_render = WineView.render("index.json", wines)
            expected_render = %{wines: 
                [
                    %{description: "some description", name: "some name", quantity: 42, rating: 42}
                ]
            }
            assert result_of_render == expected_render
        end
    end
end
