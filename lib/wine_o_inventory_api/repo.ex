defmodule WineOInventoryApi.Repo do
  use Ecto.Repo,
    otp_app: :wine_o_inventory_api,
    adapter: Ecto.Adapters.Postgres
end
