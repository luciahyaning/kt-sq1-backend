defmodule ShipmentApiWeb.Resolvers.ShipmentResolver do
  alias ShipmentApi.Shipments

  def shipments(_, _, _) do
    {:ok, Shipments.list_shipments()}
  end

  def create_shipment(_, %{input: input}, _) do
    Shipments.create_shipment(input)
  end
end
