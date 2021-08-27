defmodule ShipmentApi.TrucksTest do
  use ShipmentApi.DataCase

  alias ShipmentApi.Trucks

  describe "truck" do
    alias ShipmentApi.Trucks.Truck

    @valid_attrs %{kir: "some kir", license_number: "some license_number", plate_type: "some plate_type", production_year: 42, status: true, stnk: "some stnk", type: "some type"}
    @update_attrs %{kir: "some updated kir", license_number: "some updated license_number", plate_type: "some updated plate_type", production_year: 43, status: false, stnk: "some updated stnk", type: "some updated type"}
    @invalid_attrs %{kir: nil, license_number: nil, plate_type: nil, production_year: nil, status: nil, stnk: nil, type: nil}

    def truck_fixture(attrs \\ %{}) do
      {:ok, truck} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trucks.create_truck()

      truck
    end

    test "list_truck/0 returns all truck" do
      truck = truck_fixture()
      assert Trucks.list_truck() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Trucks.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      assert {:ok, %Truck{} = truck} = Trucks.create_truck(@valid_attrs)
      assert truck.kir == "some kir"
      assert truck.license_number == "some license_number"
      assert truck.plate_type == "some plate_type"
      assert truck.production_year == 42
      assert truck.status == true
      assert truck.stnk == "some stnk"
      assert truck.type == "some type"
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trucks.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{} = truck} = Trucks.update_truck(truck, @update_attrs)
      assert truck.kir == "some updated kir"
      assert truck.license_number == "some updated license_number"
      assert truck.plate_type == "some updated plate_type"
      assert truck.production_year == 43
      assert truck.status == false
      assert truck.stnk == "some updated stnk"
      assert truck.type == "some updated type"
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Trucks.update_truck(truck, @invalid_attrs)
      assert truck == Trucks.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Trucks.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Trucks.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Trucks.change_truck(truck)
    end
  end
end
