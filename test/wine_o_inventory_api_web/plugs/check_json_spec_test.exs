defmodule WineOInventoryApiWeb.Plugs.CheckJsonSpecTest do
    use WineOInventoryApiWeb.ConnCase
    use Plug.Test

    test "renders a 400 status level error when POST body doesn't match JSON spec" do
        conn = 
            conn("POST", "/api/wines", %{})
            |> WineOInventoryApiWeb.Plugs.CheckJsonSpec.call(%{})

        {status, _headers, body} = sent_resp(conn)

        assert status == 400
        assert body == Jason.encode!(%{errors: %{detail: "Bad Request"}})
    end
end
