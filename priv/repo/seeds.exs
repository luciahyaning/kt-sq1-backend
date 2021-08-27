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

alias ShipmentApi.Repo
alias ShipmentApi.Accounts.User
alias ShipmentApi.TruckTypes.TruckType
alias ShipmentApi.ShipmentStatuses.ShipmentStatus

# Repo.insert! %User{role: True}
# Repo.insert! %User{role: False}

Repo.insert! %TruckType{name: "Tronton"}
Repo.insert! %TruckType{name: "Container"}
Repo.insert! %TruckType{name: "CDE"}

Repo.insert! %ShipmentStatus{title: "Assigned"}
Repo.insert! %ShipmentStatus{title: "Allocated"}
Repo.insert! %ShipmentStatus{title: "Ongoing to Origin"}
Repo.insert! %ShipmentStatus{title: "At Origin"}
Repo.insert! %ShipmentStatus{title: "Ongoing to Destination"}
Repo.insert! %ShipmentStatus{title: "At Destination"}
Repo.insert! %ShipmentStatus{title: "Completed"}
Repo.insert! %ShipmentStatus{title: "Created"}
