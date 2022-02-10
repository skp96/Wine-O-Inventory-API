defmodule WineOInventoryApi.Users do
  @moduledoc """
  The Products context.
  """
  alias WineOInventoryApi.Repo

  alias WineOInventoryApi.Users.Member

  import Ecto.Query

  def create_member(attrs) do
    %Member{}
    |> Member.changeset(attrs)
    |> Repo.insert()
  end

  def list_all_member_wines(member_name) do
    query = from member in Member,
            where: member.name == ^member_name,
            inner_join: inventory in assoc(member, :inventory),
            inner_join: wine in assoc(inventory, :wines),
            left_join: store in assoc(wine, :stores),
            left_join: winery in assoc(wine, :winery),
            select: %{
              member: member.name,
              wine_name: wine.name,
              wine_description: wine.description,
              wine_rating: wine.rating,
              wine_quantity: wine.quantity,
              store_name: store.name,
              store_location: store.location,
              winery_name: winery.name,
              winery_location: winery.location
            }

    Repo.all(query)
  end
end
