defmodule WineOInventoryApiWeb.Plugs.CheckJsonSpec do
    use WineOInventoryApiWeb, :controller
    import Plug.Conn

    def init(_params) do
    end

    def call(conn, _params) do
        inspect_json(conn.method, conn)
    end

    def inspect_json("POST", conn) do
        request_body = conn.body_params
            if (request_body["data"] == nil || request_body["data"]["attributes"] == nil) do
                conn
                |> put_status(:bad_request)
                |> json(%{errors: %{detail: "Bad Request"}})
                |> halt()
            end
        conn
    end

    def inspect_json(_method, conn) do
        conn
    end
end
