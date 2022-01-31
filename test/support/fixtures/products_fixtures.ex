defmodule WineOInventoryApi.ProductsFixtures do
    alias WineOInventoryApi.Products
    @moduledoc """
    This module defines test helpers
    """

    @doc """
    Generates a wine product
    """

    def create_wine_fixture() do
        {:ok, wine} = 
            %{}
            |> Enum.into(%{
                name: "some name",
                description: "some description",
                rating: 5,
                quantity: 10
            })
            |> Products.create_wine()
        
        wine
    end

    def changeset_fixture(attrs) do
        {:error, changeset} = Products.create_wine(attrs)
        changeset
    end
end
