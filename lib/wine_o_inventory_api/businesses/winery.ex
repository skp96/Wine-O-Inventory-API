defmodule WineOInventoryApi.Businesses.Winery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wineries" do
    field :location, :string
    field :name, :string
    field :phone_number, :string

    has_many :wines, WineOInventoryApi.Products.Wine

    timestamps()
  end

  @doc false
  def changeset(winery, attrs) do
    winery
    |> cast(attrs, [:name, :location, :phone_number])
    |> cast_assoc(:wines)
    |> validate_required([:name])
  end
end
