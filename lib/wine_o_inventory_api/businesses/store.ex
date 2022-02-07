defmodule WineOInventoryApi.Businesses.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :location, :string
    field :name, :string
    field :phone_number, :string

    many_to_many :wines, WineOInventoryApi.Products.Wine,
      join_through: "store_wines"

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name, :location, :phone_number])
    |> cast_assoc(:wines)
    |> validate_required([:name])
  end
end
