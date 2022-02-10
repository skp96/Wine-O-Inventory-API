defmodule WineOInventoryApi.BusinessesTest do
    use WineOInventoryApi.DataCase

    alias WineOInventoryApi.Businesses

    import WineOInventoryApi.BusinessesFixtures

    describe "stores" do
        alias WineOInventoryApi.Businesses.Store

        @valid_attrs %{name: "some store"}
        @invalid_attrs %{name: nil}

        test "create_store/0 with valid data returns a store" do
            assert {:ok, %Store{} = store} = Businesses.create_store(@valid_attrs)
            assert store.name == "some store"
        end

        test "create_store/0 with invalid data returns an error changset" do
            assert {:error, %Ecto.Changeset{}} = Businesses.create_store(@invalid_attrs)
        end

        test "list_wines_with_rating_from_winery/3 returns all wines with given rating or higher from given winery" do
            create_store_with_assoc_fixture()
            assert Businesses.list_wines_with_rating_from_winery("some store", 3, "some winery") == [%{rating: 4, store: "some store", wine: "some name"}]
        end

        test "list_wines_with_rating_from_winery/3 returns empty list when unable to find wines with given rating or higher from given winery" do
            assert Businesses.list_wines_with_rating_from_winery("some store", 5, "some winery") == []
        end
    end


end
