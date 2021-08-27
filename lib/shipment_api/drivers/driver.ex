defmodule ShipmentApi.Drivers.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :id_card, :string
    field :license, :string
    field :name, :string
    field :phone_number, :string
    field :status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:name, :phone_number, :id_card, :license, :status])
    |> validate_required([:name, :phone_number, :id_card, :license, :status])
  end
end
