defmodule WineOInventoryApiWeb.PageControllerTest do
  use WineOInventoryApiWeb.ConnCase

  describe "index" do
    test "renders index.html", %{conn: conn} do
      conn = get(conn, Routes.page_path(conn, :index))
      assert Phoenix.Controller.view_template(conn) == "index.html"
    end
  end
end
