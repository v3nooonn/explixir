defmodule Org.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Org.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Org.PubSub},
      # Start Finch
      {Finch, name: Org.Finch}
      # Start a worker by calling: Org.Worker.start_link(arg)
      # {Org.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Org.Supervisor)
  end
end
