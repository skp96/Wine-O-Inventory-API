defmodule WineOInventoryApiWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :wine_o_inventory_api

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_wine_o_inventory_api_key",
    signing_salt: "/RISDHg0"
  ]

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: {:wine_o_inventory_api, "priv/static"},
    gzip: false,
    only:
      ~w(assets fonts images favicon.ico robots.txt asset-manifest.json manifest.json logo192.png logo512.png)

  plug Plug.Static,
    at: "/static",
    from: {:wine_o_inventory_api, "priv/static/static"},
    gzip: false

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :wine_o_inventory_api
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug CORSPlug, origin: "*"
  plug WineOInventoryApiWeb.Router
end
