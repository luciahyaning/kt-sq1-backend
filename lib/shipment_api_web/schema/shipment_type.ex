defmodule ShipmentApiWeb.Schema.Types.ShipmentType do
  use Absinthe.Schema.Notation

  object :shipment_type do
    field :id, :id
    field :shipment_no, :string
    field :origin, :string
    field :destination, :string
    field :loading_date, :string
    field :truck_id, :id
    field :driver_id, :id
    field :status_id, :id, default_value: 8
  end

  input_object :shipment_input_type do
    field :shipment_no, non_null(:string)
    field :origin, non_null(:string)
    field :destination, non_null(:string)
    field :loading_date, non_null(:string )
  end
end
