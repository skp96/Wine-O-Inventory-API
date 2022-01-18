# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :wine_o_inventory_api,
  ecto_repos: [WineOInventoryApi.Repo]

# Configures the endpoint
config :wine_o_inventory_api, WineOInventoryApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: WineOInventoryApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WineOInventoryApi.PubSub,
  live_view: [signing_salt: "Xth93pzF"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :wine_o_inventory_api, WineOInventoryApi.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
