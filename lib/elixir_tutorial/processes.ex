defmodule ElixirTutorial.Processes do
  @moduledoc """
  Demonstrates Elixir's lightweight processes and message passing.

  This module shows:
  - Process creation with spawn
  - Message passing with send and receive
  - Process monitoring
  - Process linking
  """

  @doc """
  Demonstrates basic process creation and message passing.

  ## Examples

      iex> ElixirTutorial.Processes.simple_message_passing()
      :message_sent
  """
  def simple_message_passing do
    parent = self()

    # Spawn a new process
    child = spawn(fn ->
      receive do
        {:hello, from} ->
          send(from, {:reply, "Hello back!"})
        other ->
          IO.puts("Unexpected message: #{inspect(other)}")
      end
    end)

    # Send message to child process
    send(child, {:hello, parent})

    # Wait for reply
    receive do
      {:reply, message} ->
        IO.puts("Received: #{message}")
        :message_sent
    after
      1000 -> :timeout
    end
  end

  @doc """
  Demonstrates process monitoring.

  ## Examples

      iex> ElixirTutorial.Processes.monitor_process()
      {:process_died, :normal}
  """
  def monitor_process do
    # Spawn a process that will exit after a short delay
    pid = spawn(fn ->
      Process.sleep(100)
      exit(:normal)
    end)

    # Monitor the process
    Process.monitor(pid)

    # Wait for the DOWN message
    receive do
      {:DOWN, _ref, :process, ^pid, reason} ->
        {:process_died, reason}
    after
      1000 -> :timeout
    end
  end

  @doc """
  Demonstrates process linking and trapping exits.

  ## Examples

      iex> ElixirTutorial.Processes.link_processes()
      {:linked_process_exited, :normal}
  """
  def link_processes do
    # Trap exits so we don't die when linked process dies
    Process.flag(:trap_exit, true)

    # Spawn and link to a process
    pid = spawn_link(fn ->
      Process.sleep(100)
      exit(:normal)
    end)

    # Wait for the EXIT message
    receive do
      {:EXIT, ^pid, reason} ->
        {:linked_process_exited, reason}
    after
      1000 -> :timeout
    end
  end

  @doc """
  Demonstrates creating a simple server process.

  ## Examples

      iex> server_pid = ElixirTutorial.Processes.start_simple_server()
      iex> ElixirTutorial.Processes.call_server(server_pid, {:add, 5, 3})
      8
  """
  def start_simple_server do
    spawn(fn -> server_loop(%{}) end)
  end

  def call_server(server_pid, message) do
    send(server_pid, {self(), message})

    receive do
      {:response, response} -> response
    after
      1000 -> :timeout
    end
  end

  defp server_loop(state) do
    receive do
      {from, {:add, a, b}} ->
        send(from, {:response, a + b})
        server_loop(state)

      {from, {:set, key, value}} ->
        new_state = Map.put(state, key, value)
        send(from, {:response, :ok})
        server_loop(new_state)

      {from, {:get, key}} ->
        value = Map.get(state, key, :not_found)
        send(from, {:response, value})
        server_loop(state)

      {from, :stop} ->
        send(from, {:response, :stopped})
        # Exit the loop to stop the process

      other ->
        IO.puts("Unknown message: #{inspect(other)}")
        server_loop(state)
    end
  end

  @doc """
  Demonstrates spawning many processes to show lightweight nature.

  ## Examples

      iex> ElixirTutorial.Processes.spawn_many_processes(1000)
      1000
  """
  def spawn_many_processes(count) do
    parent = self()

    # Spawn many processes
    pids = for i <- 1..count do
      spawn(fn ->
        # Do some work
        Process.sleep(:rand.uniform(10))
        send(parent, {:done, i})
      end)
    end

    # Wait for all processes to complete
    for _i <- 1..count do
      receive do
        {:done, _} -> :ok
      end
    end

    length(pids)
  end
end
