defmodule ShipmentApiWeb.Schema.Types.Trucktype do
  use Absinthe.Schema.Notation

  object :truck_type do
    field :id, :id
    field :name, :string
    field :production_year, :integer
    field :type_id, :integer
    field :plate_type, :string
    field :license_number, :string
    field :stnk, :string
    field :kir, :string
    field :status, :boolean
  end

  input_object :truck_input_type do
    field :name, non_null(:string)
    field :production_year, non_null(:integer)
    field :type_id, non_null(:integer)
    field :plate_type, non_null(:string)
    field :license_number, non_null(:string)
    field :stnk, :string
    field :kir, :string
    field :status, :boolean
  end
end
