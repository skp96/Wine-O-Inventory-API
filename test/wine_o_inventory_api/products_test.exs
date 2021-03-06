defmodule WineOInventoryApi.ProductsTest do
  use WineOInventoryApi.DataCase

  alias WineOInventoryApi.Products

  import WineOInventoryApi.ProductsFixtures

  describe "wines" do
    alias WineOInventoryApi.Products.Wine

    @valid_attrs %{name: "some name", description: "some description", rating: 5, quantity: 10}
    @invalid_attrs %{name: nil, description: nil, rating: nil, quantity: nil}

    test "list_wines/0 returns all wines" do
      assert Products.list_wines() == []
    end

    test "create_wine/1 with valid data returns a wine" do
      assert {:ok, %Wine{} = wine} = Products.create_wine(@valid_attrs)
      assert wine.name == "some name"
      assert wine.description == "some description"
      assert wine.rating == 5
      assert wine.quantity == 10
    end

    test "create_wine/1 with invalid data returns an error changset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_wine(@invalid_attrs)
    end

    test "list_wines_with_stores_with_winery/0 returns all wines along with associated stores and winery" do
      create_wine_with_assoc_fixture()
      assert Products.list_wines_with_stores_with_winery() == [
        %{
          wine_name: "some name",
          wine_description: "some description",
          wine_rating: 5,
          wine_quantity: 10,
          store_name: "some store",
          store_location: nil,
          winery_name: "some winery",
          winery_location: nil
        },
        %{
          wine_name: "some name",
          wine_description: "some description",
          wine_rating: 5,
          wine_quantity: 10,
          store_name: "some other store",
          store_location: nil,
          winery_name: "some winery",
          winery_location: nil
        }
      ]
    end
  end

  test "list_wines_with_stores_with_winery/0 returns an empty list when no wines with assocated stores and winery can be found" do
    assert Products.list_wines_with_stores_with_winery() == []
  end
end
