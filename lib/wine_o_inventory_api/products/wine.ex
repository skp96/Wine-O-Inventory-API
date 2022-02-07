defmodule WineOInventoryApi.Products.Wine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wines" do
    field :description, :string
    field :name, :string
    field :quantity, :integer
    field :rating, :integer

    many_to_many :stores, WineOInventoryApi.Businesses.Store,
      join_through: "store_wines"

    timestamps()
  end

  @doc false
  def changeset(wine, attrs) do
    wine
    |> cast(attrs, [:name, :description, :rating, :quantity])
    |> cast_assoc(:stores)
    |> validate_inclusion(:rating, 0..5)
    |> validate_required([:name, :description, :rating, :quantity])
  end
end
