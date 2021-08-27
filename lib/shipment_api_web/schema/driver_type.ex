defmodule ShipmentApiWeb.Schema.Types.Drivertype do
  use Absinthe.Schema.Notation

  object :driver_type do
    field :id, :id
    field :name, :string
    field :phone_number, :string
    field :id_card, :string
    field :license, :string
    field :status, :boolean, default_value: false
  end

  input_object :driver_input_type do
    field :name, non_null(:string)
    field :phone_number, non_null(:string)
    field :id_card, :string
    field :license, :string
    field :status, :boolean
  end
end
