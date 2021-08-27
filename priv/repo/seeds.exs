# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ShipmentApi.Repo.insert!(%ShipmentApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Repo.insert! %users{id: 1, role: "Transporter"}
Repo.insert! %users{id: 2, role: "Shipper"}

Repo.insert! %truck_types{id: 1, name: "Tronton"}
Repo.insert! %truck_types{id: 2, name: "Container"}
Repo.insert! %truck_types{id: 3, name: "CDE"}

Repo.insert! %shipment_status{id: 1, name: "Assigned"}
Repo.insert! %shipment_status{id: 2, name: "Allocated"}
Repo.insert! %shipment_status{id: 3, name: "Ongoing to Origin"}
Repo.insert! %shipment_status{id: 4, name: "At Origin"}
Repo.insert! %shipment_status{id: 5, name: "Ongoing to Destination"}
Repo.insert! %shipment_status{id: 6, name: "At Destination”}
Repo.insert! %shipment_status{id: 7, name: "Completed"}