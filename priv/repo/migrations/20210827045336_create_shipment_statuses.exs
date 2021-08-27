defmodule ShipmentApi.Repo.Migrations.CreateShipmentStatuses do
  use Ecto.Migration

  def change do
    create table(:shipment_statuses) do
      add :title, :string, null: false

      timestamps()
    end

  end
end
