defmodule ShipmentApi.Repo.Migrations.CreateTruck do
  use Ecto.Migration

  def change do
    create table(:truck) do
      add :license_number, :string
      add :type, references(:truck_types)
      add :plate_type, :string
      add :production_year, :integer
      add :stnk, :string, null: true
      add :kir, :string, null: true
      add :status, :boolean, default: true, null: false

      timestamps()
    end

  end
end
