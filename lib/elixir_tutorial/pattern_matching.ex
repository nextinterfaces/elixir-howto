defmodule ElixirTutorial.PatternMatching do
  @moduledoc """
  Demonstrates Elixir's powerful pattern matching capabilities.

  Pattern matching is one of Elixir's most powerful features. It allows you to:
  - Destructure data
  - Match specific values
  - Extract parts of complex data structures
  - Control program flow
  """

  @doc """
  Demonstrates basic pattern matching with tuples.

  ## Examples

      iex> ElixirTutorial.PatternMatching.handle_result({:ok, "data"})
      "Success: data"

      iex> ElixirTutorial.PatternMatching.handle_result({:error, "not found"})
      "Error: not found"
  """
  def handle_result({:ok, data}) do
    "Success: #{data}"
  end

  def handle_result({:error, reason}) do
    "Error: #{reason}"
  end

  def handle_result(_) do
    "Unknown result format"
  end

  @doc """
  Demonstrates pattern matching with lists.

  ## Examples

      iex> ElixirTutorial.PatternMatching.list_pattern([])
      "Empty list"

      iex> ElixirTutorial.PatternMatching.list_pattern([1])
      "Single element: 1"

      iex> ElixirTutorial.PatternMatching.list_pattern([1, 2, 3])
      "First: 1, Rest: [2, 3]"
  """
  def list_pattern([]) do
    "Empty list"
  end

  def list_pattern([single]) do
    "Single element: #{single}"
  end

  def list_pattern([head | tail]) do
    "First: #{head}, Rest: #{inspect(tail)}"
  end

  @doc """
  Demonstrates pattern matching with maps.

  ## Examples

      iex> ElixirTutorial.PatternMatching.process_user(%{name: "John", age: 30})
      "User John is 30 years old"

      iex> ElixirTutorial.PatternMatching.process_user(%{name: "Jane"})
      "User Jane, age unknown"
  """
  def process_user(%{name: name, age: age}) do
    "User #{name} is #{age} years old"
  end

  def process_user(%{name: name}) do
    "User #{name}, age unknown"
  end

  def process_user(_) do
    "Invalid user data"
  end

  @doc """
  Demonstrates guards in pattern matching.

  ## Examples

      iex> ElixirTutorial.PatternMatching.categorize_number(5)
      "Small positive number"

      iex> ElixirTutorial.PatternMatching.categorize_number(-3)
      "Negative number"

      iex> ElixirTutorial.PatternMatching.categorize_number(150)
      "Large positive number"
  """
  def categorize_number(n) when is_integer(n) and n > 0 and n < 10 do
    "Small positive number"
  end

  def categorize_number(n) when is_integer(n) and n >= 10 do
    "Large positive number"
  end

  def categorize_number(n) when is_integer(n) and n < 0 do
    "Negative number"
  end

  def categorize_number(n) when is_float(n) do
    "Floating point number"
  end

  def categorize_number(_) do
    "Not a number"
  end

  @doc """
  Demonstrates pattern matching in function parameters with case.

  ## Examples

      iex> ElixirTutorial.PatternMatching.parse_response(%{status: 200, body: "OK"})
      {:success, "OK"}

      iex> ElixirTutorial.PatternMatching.parse_response(%{status: 404, body: "Not Found"})
      {:client_error, "Not Found"}

      iex> ElixirTutorial.PatternMatching.parse_response(%{status: 500, body: "Server Error"})
      {:server_error, "Server Error"}
  """
  def parse_response(response) do
    case response do
      %{status: status, body: body} when status >= 200 and status < 300 ->
        {:success, body}

      %{status: status, body: body} when status >= 400 and status < 500 ->
        {:client_error, body}

      %{status: status, body: body} when status >= 500 ->
        {:server_error, body}

      _ ->
        {:unknown, "Invalid response format"}
    end
  end

  @doc """
  Demonstrates the pin operator (^) to match against existing variables.

  ## Examples

      iex> ElixirTutorial.PatternMatching.match_existing_value([1, 2, 3], 1)
      "Found 1 at the beginning"

      iex> ElixirTutorial.PatternMatching.match_existing_value([1, 2, 3], 2)
      "1 is not at the beginning"
  """
  def match_existing_value(list, expected_first) do
    case list do
      [^expected_first | _] ->
        "Found #{expected_first} at the beginning"

      _ ->
        "#{expected_first} is not at the beginning"
    end
  end
end
