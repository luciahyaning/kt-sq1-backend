defmodule ShipmentApi.ShipmentStatuses.ShipmentStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipment_statuses" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(shipment_status, attrs) do
    shipment_status
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
