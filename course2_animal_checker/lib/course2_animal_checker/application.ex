defmodule Course2AnimalChecker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Course2AnimalCheckerWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:course2_animal_checker, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Course2AnimalChecker.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Course2AnimalChecker.Finch},
      # Start a worker by calling: Course2AnimalChecker.Worker.start_link(arg)
      # {Course2AnimalChecker.Worker, arg},
      # Start to serve requests, typically the last entry
      Course2AnimalCheckerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Course2AnimalChecker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Course2AnimalCheckerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
