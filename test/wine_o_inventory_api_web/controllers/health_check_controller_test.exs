defmodule WineOInventoryApiWeb.HealthCheckControllerTest do
    use WineOInventoryApiWeb.ConnCase

    test "GET /health-check", %{conn: conn} do
        conn = get(conn, Routes.health_check_path(conn, :show))
        assert json_response(conn, 200)["data"] == %{"status" => "pass"}
    end
    
end