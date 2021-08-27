# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :shipment_api,
  ecto_repos: [ShipmentApi.Repo]

# Configures the endpoint
config :shipment_api, ShipmentApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pOzXNxVqOTQPKdlGP/hBBaplshli7sXGH3uAvOpwjPn1V6TQak40fkBxjKPaMVgU",
  render_errors: [view: ShipmentApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ShipmentApi.PubSub,
  live_view: [signing_salt: "0Kl0nvsW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
