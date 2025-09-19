defmodule ElixirTutorial.Functions do
  @moduledoc """
  Demonstrates different types of functions in Elixir.

  Elixir supports:
  - Named functions (defined with def)
  - Anonymous functions (defined with fn)
  - Function capturing
  - Higher-order functions
  - Recursion
  """

  @doc """
  Demonstrates recursion with a factorial function.

  ## Examples

      iex> ElixirTutorial.Functions.factorial(5)
      120

      iex> ElixirTutorial.Functions.factorial(0)
      1
  """
  def factorial(0), do: 1
  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  @doc """
  Demonstrates tail recursion with sum calculation.

  ## Examples

      iex> ElixirTutorial.Functions.sum_list([1, 2, 3, 4, 5])
      15

      iex> ElixirTutorial.Functions.sum_list([])
      0
  """
  def sum_list(list), do: sum_list(list, 0)

  defp sum_list([], acc), do: acc
  defp sum_list([head | tail], acc) do
    sum_list(tail, acc + head)
  end

  @doc """
  Demonstrates anonymous functions.

  ## Examples

      iex> ElixirTutorial.Functions.anonymous_examples()
      %{
        square: 25,
        add: 8,
        greet: "Hello, World!"
      }
  """
  def anonymous_examples do
    # Anonymous function to square a number
    square = fn x -> x * x end

    # Anonymous function with multiple clauses
    add = fn
      x, y when is_number(x) and is_number(y) -> x + y
      _, _ -> :error
    end

    # Anonymous function using & shorthand
    greet = &("Hello, #{&1}!")

    %{
      square: square.(5),
      add: add.(3, 5),
      greet: greet.("World")
    }
  end

  @doc """
  Demonstrates higher-order functions.

  ## Examples

      iex> ElixirTutorial.Functions.higher_order_examples()
      %{
        mapped: [2, 4, 6, 8, 10],
        filtered: [2, 4],
        reduced: 15
      }
  """
  def higher_order_examples do
    numbers = [1, 2, 3, 4, 5]

    %{
      mapped: Enum.map(numbers, &(&1 * 2)),
      filtered: Enum.filter(numbers, &(&1 < 5)),
      reduced: Enum.reduce(numbers, 0, &(&1 + &2))
    }
  end

  @doc """
  Demonstrates function capturing.

  ## Examples

      iex> ElixirTutorial.Functions.function_capture_examples()
      %{
        string_lengths: [5, 5, 4],
        uppercased: ["HELLO", "WORLD", "ELIXIR"]
      }
  """
  def function_capture_examples do
    words = ["hello", "world", "elixir"]

    %{
      string_lengths: Enum.map(words, &String.length/1),
      uppercased: Enum.map(words, &String.upcase/1)
    }
  end

  @doc """
  Demonstrates pipe operator for function composition.

  ## Examples

      iex> ElixirTutorial.Functions.pipe_examples("hello world")
      ["HELLO", "WORLD"]
  """
  def pipe_examples(text) do
    text
    |> String.upcase()
    |> String.split()
  end

  @doc """
  Demonstrates with statement for better error handling.

  ## Examples

      iex> ElixirTutorial.Functions.parse_and_double("42")
      {:ok, 84}

      iex> ElixirTutorial.Functions.parse_and_double("not_a_number")
      {:error, "Invalid number format"}
  """
  def parse_and_double(input) do
    with {number, ""} <- Integer.parse(input),
         result <- number * 2 do
      {:ok, result}
    else
      :error -> {:error, "Invalid number format"}
      {_number, _rest} -> {:error, "Invalid number format"}
    end
  end

  @doc """
  Demonstrates multiple function heads with guards.

  ## Examples

      iex> ElixirTutorial.Functions.describe_list([])
      "Empty list"

      iex> ElixirTutorial.Functions.describe_list([1])
      "Single item list"

      iex> ElixirTutorial.Functions.describe_list([1, 2, 3, 4, 5])
      "List with 5 items"
  """
  def describe_list([]), do: "Empty list"
  def describe_list([_]), do: "Single item list"
  def describe_list(list) when length(list) < 5, do: "Short list with #{length(list)} items"
  def describe_list(list), do: "List with #{length(list)} items"
end
