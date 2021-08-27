defmodule ShipmentApi.Repo.Migrations.CreateShipments do
  use Ecto.Migration

  def change do
    create table(:shipments) do
      add :shipment_no, :string, null: false
      add :origin, :string, null: false
      add :destination, :string, null: false
      add :loading_date, :utc_datetime
      add :truck_id, references(:trucks, on_delete: :nothing)
      add :driver_id, references(:drivers, on_delete: :nothing)
      add :status_id, references(:shipment_statuses, on_delete: :nothing)

      timestamps()
    end

    create index(:shipments, [:truck_id])
    create index(:shipments, [:driver_id])
    create index(:shipments, [:status_id])
  end
end
