defmodule WineOInventoryApi.ProductsTest do
  use WineOInventoryApi.DataCase

  alias WineOInventoryApi.Products

  describe "wines" do

    test "list_wines/0 returns all wines" do
      assert Products.list_wines() == []
    end
  end
end
