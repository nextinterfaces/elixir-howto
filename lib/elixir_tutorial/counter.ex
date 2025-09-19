defmodule ElixirTutorial.Counter do
  @moduledoc """
  A simple GenServer that maintains a counter state.

  This demonstrates:
  - GenServer behavior
  - State management
  - Synchronous and asynchronous calls
  - Process supervision
  """

  use GenServer

  # Client API

  @doc """
  Starts the counter GenServer.

  ## Examples

      iex> {:ok, pid} = ElixirTutorial.Counter.start_link([])
      iex> is_pid(pid)
      true
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, 0, opts)
  end

  @doc """
  Gets the current counter value.

  ## Examples

      iex> {:ok, pid} = ElixirTutorial.Counter.start_link([])
      iex> ElixirTutorial.Counter.get(pid)
      0
  """
  def get(pid) do
    GenServer.call(pid, :get)
  end

  @doc """
  Increments the counter by 1.

  ## Examples

      iex> {:ok, pid} = ElixirTutorial.Counter.start_link([])
      iex> ElixirTutorial.Counter.increment(pid)
      :ok
      iex> ElixirTutorial.Counter.get(pid)
      1
  """
  def increment(pid) do
    GenServer.cast(pid, :increment)
  end

  @doc """
  Increments the counter by a specific amount.

  ## Examples

      iex> {:ok, pid} = ElixirTutorial.Counter.start_link([])
      iex> ElixirTutorial.Counter.increment_by(pid, 5)
      :ok
      iex> ElixirTutorial.Counter.get(pid)
      5
  """
  def increment_by(pid, amount) do
    GenServer.cast(pid, {:increment_by, amount})
  end

  @doc """
  Resets the counter to 0.
  """
  def reset(pid) do
    GenServer.cast(pid, :reset)
  end

  # Server Callbacks

  @impl true
  def init(initial_value) do
    {:ok, initial_value}
  end

  @impl true
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast(:increment, state) do
    {:noreply, state + 1}
  end

  @impl true
  def handle_cast({:increment_by, amount}, state) do
    {:noreply, state + amount}
  end

  @impl true
  def handle_cast(:reset, _state) do
    {:noreply, 0}
  end

  @impl true
  def handle_info(msg, state) do
    IO.puts("Unexpected message: #{inspect(msg)}")
    {:noreply, state}
  end
end
