defmodule WineOInventoryApi.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WineOInventoryApi.Products` context.
  """

  @doc """
  Generate a wine.
  """
  def wine_fixture(attrs \\ %{}) do
    {:ok, wine} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        quantity: 42,
        rating: 5
      })
      |> WineOInventoryApi.Products.create_wine()

    wine
  end
end
