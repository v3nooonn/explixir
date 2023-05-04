defmodule OrgService.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      OrgService.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: OrgService.PubSub},
      # Start Finch
      {Finch, name: OrgService.Finch}
      # Start a worker by calling: OrgService.Worker.start_link(arg)
      # {OrgService.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: OrgService.Supervisor)
  end
end
