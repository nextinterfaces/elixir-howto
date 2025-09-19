defmodule ElixirTutorial.TaskSupervisor do
  @moduledoc """
  A Task.Supervisor for managing concurrent tasks.

  This demonstrates:
  - Task supervision
  - Concurrent processing
  - Async/await patterns
  """

  use Task.Supervisor

  def start_link(opts) do
    Task.Supervisor.start_link(opts)
  end

  @doc """
  Runs multiple tasks concurrently and waits for all to complete.

  ## Examples

      iex> tasks = [
      ...>   fn -> Process.sleep(100); 1 end,
      ...>   fn -> Process.sleep(50); 2 end,
      ...>   fn -> Process.sleep(75); 3 end
      ...> ]
      iex> results = ElixirTutorial.TaskSupervisor.run_concurrent_tasks(tasks)
      iex> Enum.sort(results)
      [1, 2, 3]
  """
  def run_concurrent_tasks(task_funs) do
    task_funs
    |> Enum.map(&Task.Supervisor.async(__MODULE__, &1))
    |> Enum.map(&Task.await/1)
  end

  @doc """
  Demonstrates fire-and-forget tasks.
  """
  def run_fire_and_forget_task(fun) do
    Task.Supervisor.start_child(__MODULE__, fun)
  end
end
