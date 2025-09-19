ExUnit.start()

# Configure ExUnit
ExUnit.configure(exclude: [:skip, :pending])

# You can add custom assertions or test helpers here
defmodule TestHelper do
  @doc """
  Helper function to assert that a process receives a message within a timeout.
  """
  def assert_receive_timeout(pattern, timeout \\ 100) do
    receive do
      unquote(pattern) -> :ok
    after
      unquote(timeout) ->
        raise "Expected to receive #{inspect(pattern)} within #{timeout}ms"
    end
  end
end
