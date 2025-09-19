defmodule ElixirTutorial.Application do
  @moduledoc """
  The ElixirTutorial Application.

  This module demonstrates how to create an OTP application with supervision.
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Add supervised processes here
      {ElixirTutorial.Counter, name: ElixirTutorial.Counter},
      {ElixirTutorial.TaskSupervisor, name: ElixirTutorial.TaskSupervisor}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirTutorial.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
