defmodule ShipmentApi.Repo.Migrations.CreateDriver do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :name, :string, null: false
      add :phone_number, :string, null: false
      add :id_card, :string
      add :license, :string
      add :status, :boolean, default: false, null: false

      timestamps()
    end
  end
end
