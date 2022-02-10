defmodule WineOInventoryApi.Businesses do
  @moduledoc """
  The Businesses context.
  """
  alias WineOInventoryApi.Repo

  alias WineOInventoryApi.Businesses.Store

  import Ecto.Query

  def list_wines_with_rating_from_winery(store, rating, winery_name) do
    subq = from winery in "wineries",
            where: winery.name == ^winery_name,
            select: winery.id

    query = from store in Store,
            where: store.name == ^store,
            inner_join: wine in assoc(store, :wines),
            where: wine.rating >= ^rating and wine.winery_id in subquery(subq),
            select: %{store: store.name, wine: wine.name, rating: wine.rating}

    Repo.all(query)
  end


end
