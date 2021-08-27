defmodule ShipmentApi.ShipmentsTest do
  use ShipmentApi.DataCase

  alias ShipmentApi.Shipments

  describe "shipments" do
    alias ShipmentApi.Shipments.Shipment

    @valid_attrs %{destination: "some destination", loading_date: "some loading_date", origin: "some origin", shipment_no: "some shipment_no"}
    @update_attrs %{destination: "some updated destination", loading_date: "some updated loading_date", origin: "some updated origin", shipment_no: "some updated shipment_no"}
    @invalid_attrs %{destination: nil, loading_date: nil, origin: nil, shipment_no: nil}

    def shipment_fixture(attrs \\ %{}) do
      {:ok, shipment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipments.create_shipment()

      shipment
    end

    test "list_shipments/0 returns all shipments" do
      shipment = shipment_fixture()
      assert Shipments.list_shipments() == [shipment]
    end

    test "get_shipment!/1 returns the shipment with given id" do
      shipment = shipment_fixture()
      assert Shipments.get_shipment!(shipment.id) == shipment
    end

    test "create_shipment/1 with valid data creates a shipment" do
      assert {:ok, %Shipment{} = shipment} = Shipments.create_shipment(@valid_attrs)
      assert shipment.destination == "some destination"
      assert shipment.loading_date == "some loading_date"
      assert shipment.origin == "some origin"
      assert shipment.shipment_no == "some shipment_no"
    end

    test "create_shipment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipments.create_shipment(@invalid_attrs)
    end

    test "update_shipment/2 with valid data updates the shipment" do
      shipment = shipment_fixture()
      assert {:ok, %Shipment{} = shipment} = Shipments.update_shipment(shipment, @update_attrs)
      assert shipment.destination == "some updated destination"
      assert shipment.loading_date == "some updated loading_date"
      assert shipment.origin == "some updated origin"
      assert shipment.shipment_no == "some updated shipment_no"
    end

    test "update_shipment/2 with invalid data returns error changeset" do
      shipment = shipment_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipments.update_shipment(shipment, @invalid_attrs)
      assert shipment == Shipments.get_shipment!(shipment.id)
    end

    test "delete_shipment/1 deletes the shipment" do
      shipment = shipment_fixture()
      assert {:ok, %Shipment{}} = Shipments.delete_shipment(shipment)
      assert_raise Ecto.NoResultsError, fn -> Shipments.get_shipment!(shipment.id) end
    end

    test "change_shipment/1 returns a shipment changeset" do
      shipment = shipment_fixture()
      assert %Ecto.Changeset{} = Shipments.change_shipment(shipment)
    end
  end
end
