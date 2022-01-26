defmodule WineOInventoryApiWeb.WineViewTest do
    use WineOInventoryApiWeb.ConnCase, async: true
    alias WineOInventoryApiWeb.WineView

    describe "index.json render" do
        test "renders list of all wines" do
            fakeWine = %{id: 1, name: "some fake wine", description: "some fake description", rating: 5, quantity: 100 }
            wines = [fakeWine]
            result_of_render = WineView.render("index.json", wines: wines)
            assert result_of_render != []
        end
    end
end
