defmodule WineOInventoryApiWeb.PageView do
  use WineOInventoryApiWeb, :view

  def render("index.html", _assigns) do
    Path.join(:code.priv_dir(:wine_o_inventory_api), "static/index.html")
    |> File.read!()
    |> Phoenix.HTML.raw()
  end
end
