defmodule WineOInventoryApiWeb.PageController do
  use WineOInventoryApiWeb, :controller

  plug :put_layout, false when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
