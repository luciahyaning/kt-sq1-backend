defmodule ShipmentApi.TruckTypes.TruckType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "truck_types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(truck_type, attrs) do
    truck_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
