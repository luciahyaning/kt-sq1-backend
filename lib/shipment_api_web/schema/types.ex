defmodule ShipmentApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias ShipmentApiWeb.Schema.Types

  import_types(Types.Drivertype)
end
