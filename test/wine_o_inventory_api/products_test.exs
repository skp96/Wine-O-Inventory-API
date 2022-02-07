defmodule WineOInventoryApi.ProductsTest do
  use WineOInventoryApi.DataCase

  alias WineOInventoryApi.Products

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
  end
end
