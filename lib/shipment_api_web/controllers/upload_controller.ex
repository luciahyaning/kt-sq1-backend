defmodule ShipmentApiWeb.UploadController do
  use ShipmentApiWeb, :controller

  def create(conn, %{"file" => %Plug.Upload{} = upload}) do
    file_dest = "uploads/#{Ecto.UUID.generate()}-#{upload.filename}"
    File.mkdir_p("uploads")
    File.cp(upload.path, Path.absname(file_dest))
    json(conn, %{path: file_dest})
  end
end
