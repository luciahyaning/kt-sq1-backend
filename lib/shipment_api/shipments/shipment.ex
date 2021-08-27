defmodule ShipmentApi.Shipments.Shipment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipments" do
    field :destination, :string
    field :loading_date, :string
    field :origin, :string
    field :shipment_no, :string
    field :truck_id, :id
    field :driver_id, :id
    field :status_id, :id

    timestamps()
  end

  @doc false
  def changeset(shipment, attrs) do
    shipment
    |> cast(attrs, [:shipment_no, :origin, :destination, :loading_date])
    |> validate_required([:shipment_no, :origin, :destination, :loading_date])
  end
end
