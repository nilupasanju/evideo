defmodule Evideo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Evideo.Repo,
      # Start the Telemetry supervisor
      EvideoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Evideo.PubSub},
      # Start the Endpoint (http/https)
      EvideoWeb.Endpoint
      # Start a worker by calling: Evideo.Worker.start_link(arg)
      # {Evideo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Evideo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EvideoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
