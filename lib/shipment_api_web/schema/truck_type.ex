defmodule ShipmentApiWeb.Schema.Types.Trucktype do
  use Absinthe.Schema.Notation

  object :truck_type do
    field :id, :id
    field :name, :string
  end

  input_object :truck_input_type do
    field :name, non_null(:string)
  end
end