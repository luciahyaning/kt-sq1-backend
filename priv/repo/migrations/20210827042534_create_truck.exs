defmodule ShipmentApi.Repo.Migrations.CreateTruck do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :license_number, :string, null: false
      add :type, references(:truck_types), null: false
      add :plate_type, :string, null: false
      add :production_year, :integer
      add :stnk, :string, null: true
      add :kir, :string, null: true
      add :status, :boolean, default: true, null: false

      timestamps()
    end

  end
end
