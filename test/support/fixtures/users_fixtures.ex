defmodule WineOInventoryApi.UsersFixtures do
    alias WineOInventoryApi.Users

    alias WineOInventoryApi.Repo

    alias WineOInventoryApi.Products.Wine

    import Ecto.Changeset
    @moduledoc """
    This module defines test helpers
    """

    @doc """
    Generates a member with associations
    """

    @wine_attrs %{
        name: "some wine",
        description: "some description",
        rating: 5,
        quantity: 10,
        stores: [%{name: "some store"}],
        winery: %{name: "some winery"}
    }
    

    def create_member_with_assoc_fixture() do
        {:ok, member} =
            %{}
            |> Enum.into(%{
                name: "some member",
                inventory: %{}
            })
            |> Users.create_member()
        
        member = Repo.preload(member, :inventory)

        Wine.changeset(%Wine{}, @wine_attrs)
        |> put_assoc(:inventories, [member.inventory])
        |> Repo.insert()
    end
end
