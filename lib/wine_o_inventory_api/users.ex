defmodule WineOInventoryApi.Users do
  @moduledoc """
  The Users context.
  """
  alias WineOInventoryApi.Repo

  alias WineOInventoryApi.Users.Member

  alias WineOInventoryApi.Businesses.Winery

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

  def list_member_wines_from_winery(member_name, winery_name) do
    subq = from winery in Winery,
            where: winery.name == ^winery_name,
            select: winery.id 

    query = from member in Member,
            where: member.name == ^member_name,
            inner_join: inventory in assoc(member, :inventory),
            inner_join: wine in assoc(inventory, :wines),
            where: wine.winery_id in subquery(subq),
            select: %{name: member.name, wine: wine.name}

    Repo.all(query)
  end
end
