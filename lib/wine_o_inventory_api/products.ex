defmodule WineOInventoryApi.Products do
  @moduledoc """
  The Products context.
  """
  alias WineOInventoryApi.Repo

  alias WineOInventoryApi.Products.Wine

  @doc """
  Returns the list of wines.

  ## Examples

      iex> list_wines()
      [%Wine{}, ...]

  """
  def list_wines do
    Repo.all(Wine)
  end
end
