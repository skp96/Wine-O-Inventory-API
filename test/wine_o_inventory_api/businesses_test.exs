defmodule WineOInventoryApi.BusinessesTest do
    use WineOInventoryApi.DataCase

    alias WineOInventoryApi.Businesses

    describe "stores" do

        test "list_wines_with_rating_from_winery/3 returns all wines with given rating from given winery" do
            assert Businesses.list_wines_with_rating_from_winery("some store", 3, "some winery") == []
        end
    end


end
