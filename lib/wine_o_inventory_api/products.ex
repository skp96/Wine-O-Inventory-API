defmodule WineOInventoryApi.Products do
  @moduledoc """
  The Products context.
  """
  alias WineOInventoryApi.Repo

  alias WineOInventoryApi.Products.Wine

  import Ecto.Query

  @doc """
  Returns the list of wines.

  ## Examples

      iex> list_wines()
      [%Wine{}, ...]

  """
  def list_wines do
    Repo.all(Wine)
  end

  def list_wines_with_stores_with_winery do
    query = from wine in "wines",
            left_join: sw in "store_wines", on: sw.wine_id == wine.id,
            left_join: store in "stores", on: store.id == sw.store_id,
            left_join: winery in "wineries", on: wine.winery_id == winery.id,
            select: %{
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

  @doc """
  Creates a wine.

  ## Examples

    iex> create_wine(%{field: value})
    {:ok, %Wine{}}

    iex> create_wine(%{field: bad value})
    {:error, %Ecto.Changeset{}}

  """

  def create_wine(attrs) do
    %Wine{}
    |> Wine.changeset(attrs)
    |> Repo.insert()
  end
end
