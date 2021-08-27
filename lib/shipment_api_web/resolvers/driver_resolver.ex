defmodule ShipmentApiWeb.Resolvers.DriverResolver do
  alias ShipmentApi.Drivers

  def drivers(_, _, _) do
    {:ok, Drivers.list_driver()}
  end

  def get_user(_, %{id: id}, _) do
    {:ok, Drivers.get_driver!(id)}
  end

  def create_driver(_, %{input: input}, _) do
    Drivers.create_driver(input)
  end

  def update_driver(_, %{id: id, input: input}, _) do
    driver_to_update = Drivers.get_driver!(id)
    Drivers.update_driver(driver_to_update, input)
  end

  def delete_driver(_, %{id: id}, _) do
    driver_to_delete = Drivers.get_driver!(id)
    Drivers.delete_driver(driver_to_delete)
  end
end
