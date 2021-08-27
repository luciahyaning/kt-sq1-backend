defmodule ShipmentApi.Repo.Migrations.CreateTruck do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :license_number, :string, null: false
      add :type_id, references(:truck_types, on_delete: :nothing), null: false
      add :plate_type, :string, null: false
      add :production_year, :integer
      add :stnk, :string, null: true
      add :kir, :string, null: true
      add :status, :boolean, default: true, null: false

      timestamps()
    end

    create index(:trucks, [:type_id])
  end
end
