defmodule WineOInventoryApi.ProductsTest do
  use WineOInventoryApi.DataCase

  alias WineOInventoryApi.Products

  describe "wines" do
    alias WineOInventoryApi.Products.Wine

    import WineOInventoryApi.ProductsFixtures

    @invalid_attrs %{description: nil, name: nil, quantity: nil, rating: nil}

    test "list_wines/0 returns all wines" do
      wine = wine_fixture()
      assert Products.list_wines() == [wine]
    end

    test "get_wine!/1 returns the wine with given id" do
      wine = wine_fixture()
      assert Products.get_wine!(wine.id) == wine
    end

    test "create_wine/1 with valid data creates a wine" do
      valid_attrs = %{description: "some description", name: "some name", quantity: 42, rating: 5}

      assert {:ok, %Wine{} = wine} = Products.create_wine(valid_attrs)
      assert wine.description == "some description"
      assert wine.name == "some name"
      assert wine.quantity == 42
      assert wine.rating == 5
    end

    test "create_wine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_wine(@invalid_attrs)
    end

    test "update_wine/2 with valid data updates the wine" do
      wine = wine_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", quantity: 43, rating: 4}

      assert {:ok, %Wine{} = wine} = Products.update_wine(wine, update_attrs)
      assert wine.description == "some updated description"
      assert wine.name == "some updated name"
      assert wine.quantity == 43
      assert wine.rating == 4
    end

    test "update_wine/2 with invalid data returns error changeset" do
      wine = wine_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_wine(wine, @invalid_attrs)
      assert wine == Products.get_wine!(wine.id)
    end

    test "delete_wine/1 deletes the wine" do
      wine = wine_fixture()
      assert {:ok, %Wine{}} = Products.delete_wine(wine)
      assert_raise Ecto.NoResultsError, fn -> Products.get_wine!(wine.id) end
    end

    test "change_wine/1 returns a wine changeset" do
      wine = wine_fixture()
      assert %Ecto.Changeset{} = Products.change_wine(wine)
    end
  end
end
