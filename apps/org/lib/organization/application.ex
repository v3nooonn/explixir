defmodule OrgEcto.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      OrgEcto.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: OrgEcto.PubSub},
      # Start Finch
      {Finch, name: OrgEcto.Finch}
      # Start a worker by calling: OrgEcto.Worker.start_link(arg)
      # {OrgEcto.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: OrgEcto.Supervisor)
  end
end
