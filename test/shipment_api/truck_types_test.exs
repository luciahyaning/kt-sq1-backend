defmodule ShipmentApi.TruckTypesTest do
  use ShipmentApi.DataCase

  alias ShipmentApi.TruckTypes

  describe "truck_types" do
    alias ShipmentApi.TruckTypes.TruckType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def truck_type_fixture(attrs \\ %{}) do
      {:ok, truck_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TruckTypes.create_truck_type()

      truck_type
    end

    test "list_truck_types/0 returns all truck_types" do
      truck_type = truck_type_fixture()
      assert TruckTypes.list_truck_types() == [truck_type]
    end

    test "get_truck_type!/1 returns the truck_type with given id" do
      truck_type = truck_type_fixture()
      assert TruckTypes.get_truck_type!(truck_type.id) == truck_type
    end

    test "create_truck_type/1 with valid data creates a truck_type" do
      assert {:ok, %TruckType{} = truck_type} = TruckTypes.create_truck_type(@valid_attrs)
      assert truck_type.name == "some name"
    end

    test "create_truck_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TruckTypes.create_truck_type(@invalid_attrs)
    end

    test "update_truck_type/2 with valid data updates the truck_type" do
      truck_type = truck_type_fixture()

      assert {:ok, %TruckType{} = truck_type} =
               TruckTypes.update_truck_type(truck_type, @update_attrs)

      assert truck_type.name == "some updated name"
    end

    test "update_truck_type/2 with invalid data returns error changeset" do
      truck_type = truck_type_fixture()

      assert {:error, %Ecto.Changeset{}} =
               TruckTypes.update_truck_type(truck_type, @invalid_attrs)

      assert truck_type == TruckTypes.get_truck_type!(truck_type.id)
    end

    test "delete_truck_type/1 deletes the truck_type" do
      truck_type = truck_type_fixture()
      assert {:ok, %TruckType{}} = TruckTypes.delete_truck_type(truck_type)
      assert_raise Ecto.NoResultsError, fn -> TruckTypes.get_truck_type!(truck_type.id) end
    end

    test "change_truck_type/1 returns a truck_type changeset" do
      truck_type = truck_type_fixture()
      assert %Ecto.Changeset{} = TruckTypes.change_truck_type(truck_type)
    end
  end
end
