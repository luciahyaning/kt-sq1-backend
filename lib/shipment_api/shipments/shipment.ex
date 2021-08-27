defmodule ShipmentApi.Shipments.Shipment do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShipmentApi.Trucks.Truck
  alias ShipmentApi.Drivers.Driver

  schema "shipments" do
    field :destination, :string
    field :loading_date, :utc_datetime
    field :origin, :string
    field :shipment_no, :string
    field :status_id, :integer, default: 8

    # belongs_to(:truck, Truck)
    # belongs_to(:driver, Driver)

    timestamps()
  end

  @doc false
  def changeset(shipment, attrs) do
    shipment
    |> cast(attrs, [:shipment_no, :origin, :destination, :loading_date])
    |> validate_required([:shipment_no, :origin, :destination, :loading_date])
  end
end
