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
  end

  mutation do
    @desc "Create a new driver"
    field :create_driver, type: :driver_type do
      arg(:input, non_null(:driver_input_type))
      resolve(&Resolvers.DriverResolver.create_driver/3)
    end

    # @desc "Update a driver"
    # field :create_driver, type: :driver_type do
    #     arg :input, non_null(:driver_input_type)
    #     resolve(&Resolvers.DriverResolver.create_driver/3)
    # end

    @desc "Delete a driver"
    field :delete_driver, type: :driver_type do
      arg(:id, non_null(:id))
      resolve(&Resolvers.DriverResolver.delete_driver/3)
    end
  end
end
