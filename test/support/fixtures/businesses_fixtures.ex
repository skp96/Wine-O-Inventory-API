defmodule WineOInventoryApi.BusinessesFixtures do
    alias WineOInventoryApi.Businesses
    @moduledoc """
    This module defines test helpers
    """

    @doc """
    Generates a store business with associations
    """

    def create_store_with_assoc_fixture() do
        {:ok, _store} =
            %{}
            |> Enum.into(%{
                name: "some store",
                wines: [
                    %{
                        name: "some name",
                        description: "some description",
                        rating: 4,
                        quantity: 10,
                        winery: %{
                            name: "some winery"
                        }
                    }
                ]
            })
            |> Businesses.create_store()
    end
end
