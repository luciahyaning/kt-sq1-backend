defmodule ShipmentApi.DriversTest do
  use ShipmentApi.DataCase

  alias ShipmentApi.Drivers

  describe "driver" do
    alias ShipmentApi.Drivers.Driver

    @valid_attrs %{
      id_card: "some id_card",
      license: "some license",
      name: "some name",
      phone_number: "some phone_number",
      status: true
    }
    @update_attrs %{
      id_card: "some updated id_card",
      license: "some updated license",
      name: "some updated name",
      phone_number: "some updated phone_number",
      status: false
    }
    @invalid_attrs %{id_card: nil, license: nil, name: nil, phone_number: nil, status: nil}

    def driver_fixture(attrs \\ %{}) do
      {:ok, driver} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drivers.create_driver()

      driver
    end

    test "list_driver/0 returns all driver" do
      driver = driver_fixture()
      assert Drivers.list_driver() == [driver]
    end

    test "get_driver!/1 returns the driver with given id" do
      driver = driver_fixture()
      assert Drivers.get_driver!(driver.id) == driver
    end

    test "create_driver/1 with valid data creates a driver" do
      assert {:ok, %Driver{} = driver} = Drivers.create_driver(@valid_attrs)
      assert driver.id_card == "some id_card"
      assert driver.license == "some license"
      assert driver.name == "some name"
      assert driver.phone_number == "some phone_number"
      assert driver.status == true
    end

    test "create_driver/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drivers.create_driver(@invalid_attrs)
    end

    test "update_driver/2 with valid data updates the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{} = driver} = Drivers.update_driver(driver, @update_attrs)
      assert driver.id_card == "some updated id_card"
      assert driver.license == "some updated license"
      assert driver.name == "some updated name"
      assert driver.phone_number == "some updated phone_number"
      assert driver.status == false
    end

    test "update_driver/2 with invalid data returns error changeset" do
      driver = driver_fixture()
      assert {:error, %Ecto.Changeset{}} = Drivers.update_driver(driver, @invalid_attrs)
      assert driver == Drivers.get_driver!(driver.id)
    end

    test "delete_driver/1 deletes the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{}} = Drivers.delete_driver(driver)
      assert_raise Ecto.NoResultsError, fn -> Drivers.get_driver!(driver.id) end
    end

    test "change_driver/1 returns a driver changeset" do
      driver = driver_fixture()
      assert %Ecto.Changeset{} = Drivers.change_driver(driver)
    end
  end
end
