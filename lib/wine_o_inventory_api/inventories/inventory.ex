defmodule WineOInventoryApi.Inventories.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventories" do
    belongs_to :member, WineOInventoryApi.Users.Member

    many_to_many :wines, WineOInventoryApi.Products.Wine,
      join_through: "inventory_wines"

    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [])
  end
end
