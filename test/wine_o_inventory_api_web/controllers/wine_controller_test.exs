defmodule WineOInventoryApiWeb.WineControllerTest do
    use WineOInventoryApiWeb.ConnCase

    describe "index" do
        test "list all wines", %{conn: conn} do
            conn = get(conn, Routes.wine_path(conn, :index))
            assert json_response(conn, 200)["wines"] == []
        end
    end

end
