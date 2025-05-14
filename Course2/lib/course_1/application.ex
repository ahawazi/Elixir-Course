defmodule Course1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Course1Web.Telemetry,
      {DNSCluster, query: Application.get_env(:course_1, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Course1.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Course1.Finch},
      # Start a worker by calling: Course1.Worker.start_link(arg)
      # {Course1.Worker, arg},
      # Start to serve requests, typically the last entry
      Course1Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Course1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Course1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
