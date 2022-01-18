defmodule WineOInventoryApiWeb.HealthCheckViewTest do
    use WineOInventoryApiWeb.ConnCase, async: true
    alias WineOInventoryApiWeb.HealthCheckView

    test "renders show.json" do
        status = %{status: "pass"}
        rendered_health_check = HealthCheckView.render("show.json", status: status)
        assert rendered_health_check == %{data: status}
    end
    
end