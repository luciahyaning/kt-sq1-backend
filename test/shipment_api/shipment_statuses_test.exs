defmodule ShipmentApi.ShipmentStatusesTest do
  use ShipmentApi.DataCase

  alias ShipmentApi.ShipmentStatuses

  describe "shipment_statuses" do
    alias ShipmentApi.ShipmentStatuses.ShipmentStatus

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def shipment_status_fixture(attrs \\ %{}) do
      {:ok, shipment_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ShipmentStatuses.create_shipment_status()

      shipment_status
    end

    test "list_shipment_statuses/0 returns all shipment_statuses" do
      shipment_status = shipment_status_fixture()
      assert ShipmentStatuses.list_shipment_statuses() == [shipment_status]
    end

    test "get_shipment_status!/1 returns the shipment_status with given id" do
      shipment_status = shipment_status_fixture()
      assert ShipmentStatuses.get_shipment_status!(shipment_status.id) == shipment_status
    end

    test "create_shipment_status/1 with valid data creates a shipment_status" do
      assert {:ok, %ShipmentStatus{} = shipment_status} = ShipmentStatuses.create_shipment_status(@valid_attrs)
      assert shipment_status.title == "some title"
    end

    test "create_shipment_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ShipmentStatuses.create_shipment_status(@invalid_attrs)
    end

    test "update_shipment_status/2 with valid data updates the shipment_status" do
      shipment_status = shipment_status_fixture()
      assert {:ok, %ShipmentStatus{} = shipment_status} = ShipmentStatuses.update_shipment_status(shipment_status, @update_attrs)
      assert shipment_status.title == "some updated title"
    end

    test "update_shipment_status/2 with invalid data returns error changeset" do
      shipment_status = shipment_status_fixture()
      assert {:error, %Ecto.Changeset{}} = ShipmentStatuses.update_shipment_status(shipment_status, @invalid_attrs)
      assert shipment_status == ShipmentStatuses.get_shipment_status!(shipment_status.id)
    end

    test "delete_shipment_status/1 deletes the shipment_status" do
      shipment_status = shipment_status_fixture()
      assert {:ok, %ShipmentStatus{}} = ShipmentStatuses.delete_shipment_status(shipment_status)
      assert_raise Ecto.NoResultsError, fn -> ShipmentStatuses.get_shipment_status!(shipment_status.id) end
    end

    test "change_shipment_status/1 returns a shipment_status changeset" do
      shipment_status = shipment_status_fixture()
      assert %Ecto.Changeset{} = ShipmentStatuses.change_shipment_status(shipment_status)
    end
  end
end
