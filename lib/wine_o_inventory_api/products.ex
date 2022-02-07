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
