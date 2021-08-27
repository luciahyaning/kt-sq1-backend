defmodule ShipmentApi.Trucks.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :kir, :string
    field :license_number, :string
    field :plate_type, Ecto.Enum, values: [:black, :yellow]
    field :production_year, :integer
    field :status, :boolean, default: true
    field :stnk, :string
    field :type_id, :integer

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [
      :license_number,
      :type_id,
      :plate_type,
      :production_year,
      :stnk,
      :kir,
      :status
    ])
    |> validate_required([
      :license_number,
      :type_id,
      :plate_type,
      :production_year,
      :status
    ])
  end
end
