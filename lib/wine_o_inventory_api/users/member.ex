defmodule WineOInventoryApi.Users.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :name, :string

    has_one :inventory, WineOInventoryApi.Inventories.Inventory, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:name])
    |> cast_assoc(:inventory)
    |> validate_required([:name])
  end
end
