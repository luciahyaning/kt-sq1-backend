defmodule ShipmentApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :role, :boolean

      timestamps()
    end

  end
end
