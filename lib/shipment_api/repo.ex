defmodule ShipmentApi.Repo do
  use Ecto.Repo,
    otp_app: :shipment_api,
    adapter: Ecto.Adapters.Postgres
end
