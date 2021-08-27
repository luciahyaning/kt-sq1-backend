defmodule ShipmentApiWeb.Schema do
  use Absinthe.Schema

  alias ShipmentApiWeb.Resolvers
  # alias ShipmentApiWeb.Schema.Middleware
  # import Types
  import_types(ShipmentApiWeb.Schema.Types)

  query do
    @desc "Get a list of all drivers"
    field :drivers, list_of(:driver_type) do
      # Resolve
      # middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.DriverResolver.drivers/3)
    end

    @desc "Get a driver"
    field :driver, list_of(:driver_type) do
      # Resolve
      # middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.DriverResolver.driver/3)
    end
    
    @desc "Get a list of all trucks"
    field :trucks, list_of(:truck_type) do
      # Resolve
      # middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.DriverResolver.drivers/3)
    end

    @desc "Get a truck"
    field :truck, list_of(:truck_type) do
      # Resolve
      # middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.DriverResolver.driver/3)
    end
  end

  mutation do
    @desc "Create a new driver"
    field :create_driver, type: :driver_type do
      arg(:input, non_null(:driver_input_type))
      resolve(&Resolvers.DriverResolver.create_driver/3)
    end

    @desc "Update a driver"
    field :update_driver, type: :driver_type do
      arg(:input, non_null(:driver_update_type))
      arg(:id, non_null(:id))
      resolve(&Resolvers.DriverResolver.update_driver/3)
    end

    @desc "Update a driver status"
    field :update_driver_status, type: :driver_type do
      arg(:input, non_null(:driver_status_update_type))
      arg(:id, non_null(:id))
      resolve(&Resolvers.DriverResolver.update_driver/3)
    end

    @desc "Delete a driver"
    field :delete_driver, type: :driver_type do
      arg(:id, non_null(:id))
      resolve(&Resolvers.DriverResolver.delete_driver/3)
    end
    
     @desc "Create a new truck"
      field :create_truck, type: :truck_type do
        arg(:input, non_null(:driver_input_type))
        resolve(&Resolvers.DriverResolver.create_truck/3)
      end

      @desc "Update a truck"
      field :update_truck, type: :truck_type do
        arg(:input, non_null(:truck_update_type))
        arg(:id, non_null(:id))
        resolve(&Resolvers.DriverResolver.update_truck/3)
      end

      @desc "Update a truck status"
      field :update_truck_status, type: :truck_type do
        arg(:input, non_null(:truck_status_update_type))
        arg(:id, non_null(:id))
        resolve(&Resolvers.TruckResolver.update_truck/3)
      end

      @desc "Delete a truck"
      field :delete_truck, type: :truck_type do
        arg(:id, non_null(:id))
        resolve(&Resolvers.DriverResolver.delete_truck/3)
      end
  
  end
  
end
