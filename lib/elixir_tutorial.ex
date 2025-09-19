defmodule ElixirTutorial do
  @moduledoc """
  Welcome to Elixir Tutorial!

  This module demonstrates basic Elixir concepts including:
  - Data types
  - Pattern matching
  - Functions
  - Documentation

  ## Examples

      iex> ElixirTutorial.hello()
      "Hello, World!"

      iex> ElixirTutorial.hello("Elixir")
      "Hello, Elixir!"
  """

  @doc """
  Returns a greeting message.

  ## Parameters

    * `name` - The name to greet (optional, defaults to "World")

  ## Examples

      iex> ElixirTutorial.hello()
      "Hello, World!"

      iex> ElixirTutorial.hello("Elixir")
      "Hello, Elixir!"
  """
  def hello(name \\ "World") do
    "Hello, #{name}!"
  end

  @doc """
  Demonstrates basic arithmetic operations.

  ## Examples

      iex> ElixirTutorial.calculate(:add, 5, 3)
      8

      iex> ElixirTutorial.calculate(:multiply, 4, 7)
      28
  """
  def calculate(operation, a, b) do
    case operation do
      :add -> a + b
      :subtract -> a - b
      :multiply -> a * b
      :divide when b != 0 -> a / b
      :divide -> {:error, "Cannot divide by zero"}
      _ -> {:error, "Unknown operation"}
    end
  end

  @doc """
  Demonstrates pattern matching with different data types.

  ## Examples

      iex> ElixirTutorial.describe_data(42)
      "This is an integer: 42"

      iex> ElixirTutorial.describe_data("hello")
      "This is a string: hello"

      iex> ElixirTutorial.describe_data([1, 2, 3])
      "This is a list with 3 elements"
  """
  def describe_data(data) do
    case data do
      n when is_integer(n) -> "This is an integer: #{n}"
      s when is_binary(s) -> "This is a string: #{s}"
      l when is_list(l) -> "This is a list with #{length(l)} elements"
      %{} = map -> "This is a map with #{map_size(map)} keys"
      {_, _} -> "This is a tuple with 2 elements"
      _ -> "This is some other data type"
    end
  end
end
