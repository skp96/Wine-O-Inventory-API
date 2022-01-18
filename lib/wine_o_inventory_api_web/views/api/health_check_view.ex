defmodule WineOInventoryApiWeb.HealthCheckView  do
    use WineOInventoryApiWeb, :view

    def render("show.json", %{status: status}) do
        %{data: status}
    end
    
end