defmodule ShipmentApiWeb.PageController do
  use ShipmentApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
