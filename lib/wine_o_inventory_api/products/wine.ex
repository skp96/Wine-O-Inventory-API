defmodule WineOInventoryApi.Products.Wine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wines" do
    field :description, :string
    field :name, :string
    field :quantity, :integer
    field :rating, :integer

    timestamps()
  end

  @doc false
  def changeset(wine, attrs) do
    wine
    |> cast(attrs, [:name, :description, :rating, :quantity])
    |> validate_required([:name, :description, :rating, :quantity])
  end
end
