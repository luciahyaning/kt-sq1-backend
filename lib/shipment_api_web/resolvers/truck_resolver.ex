defmodule ShipmentApiWeb.Resolvers.TruckResolver do
  alias ShipmentApi.Trucks

  def trucks(_, _, _) do
    {:ok, Trucks.list_truck()}
  end

  def truck(_, %{id: id}, _) do
    {:ok, Trucks.get_truck!(id)}
  end

  def create_truck(_, %{input: input}, _) do
    Trucks.create_truck(input)
  end

  # def update_truck(_,%{input: input},_) do
  #     Accounts.create_truck(input)
  # end

  def delete_truck(_, %{id: id}, _) do
    truck_to_delete = Trucks.get_truck!(id)
    Trucks.delete_truck(truck_to_delete)
  end
end
