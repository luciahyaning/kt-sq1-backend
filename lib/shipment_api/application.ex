defmodule ShipmentApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ShipmentApi.Repo,
      # Start the Telemetry supervisor
      ShipmentApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ShipmentApi.PubSub},
      # Start the Endpoint (http/https)
      ShipmentApiWeb.Endpoint
      # Start a worker by calling: ShipmentApi.Worker.start_link(arg)
      # {ShipmentApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShipmentApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ShipmentApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
