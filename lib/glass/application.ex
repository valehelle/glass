defmodule Glass.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Glass.Repo,
      # Start the Telemetry supervisor
      GlassWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Glass.PubSub},
      # Crypto
      Glass.Vault,
      # Start the Endpoint (http/https)
      GlassWeb.Endpoint
      # Start a worker by calling: Glass.Worker.start_link(arg)
      # {Glass.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Glass.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GlassWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
