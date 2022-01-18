defmodule WineOInventoryApiWeb.HealthCheckController do
    use WineOInventoryApiWeb, :controller

    def show(conn, _params) do
        status = %{status: "pass"}
        render(conn, "show.json", status: status)
    end
end