defmodule ElixirTutorial.DataTypes do
  @moduledoc """
  Demonstrates Elixir's built-in data types and common operations.

  Elixir has several basic data types:
  - Integers: 1, 2, 1000
  - Floats: 1.5, 3.14
  - Booleans: true, false
  - Atoms: :ok, :error, :hello
  - Strings: "hello world"
  - Lists: [1, 2, 3]
  - Tuples: {1, 2, 3}
  - Maps: %{key: "value"}
  """

  @doc """
  Demonstrates working with integers.

  ## Examples

      iex> ElixirTutorial.DataTypes.integer_examples()
      %{
        basic: 42,
        binary: 0b1010,
        octal: 0o644,
        hex: 0xFF,
        large: 1_000_000
      }
  """
  def integer_examples do
    %{
      basic: 42,
      binary: 0b1010,    # Binary notation (10 in decimal)
      octal: 0o644,      # Octal notation (420 in decimal)
      hex: 0xFF,         # Hexadecimal notation (255 in decimal)
      large: 1_000_000   # Underscores for readability
    }
  end

  @doc """
  Demonstrates working with atoms.

  ## Examples

      iex> ElixirTutorial.DataTypes.atom_examples()
      [:ok, :error, :hello_world, true, false, nil]
  """
  def atom_examples do
    # Atoms are constants where their name is their value
    [:ok, :error, :hello_world, true, false, nil]
  end

  @doc """
  Demonstrates working with lists.

  ## Examples

      iex> ElixirTutorial.DataTypes.list_operations([1, 2, 3])
      %{
        original: [1, 2, 3],
        head: 1,
        tail: [2, 3],
        prepend: [0, 1, 2, 3],
        append: [1, 2, 3, 4],
        length: 3
      }
  """
  def list_operations(list) do
    [head | tail] = list

    %{
      original: list,
      head: head,
      tail: tail,
      prepend: [0 | list],
      append: list ++ [4],
      length: length(list)
    }
  end

  @doc """
  Demonstrates working with tuples.

  ## Examples

      iex> ElixirTutorial.DataTypes.tuple_examples()
      %{
        coordinates: {3, 4},
        result: {:ok, "Success"},
        error: {:error, "Something went wrong"},
        size: 2
      }
  """
  def tuple_examples do
    coordinates = {3, 4}

    %{
      coordinates: coordinates,
      result: {:ok, "Success"},
      error: {:error, "Something went wrong"},
      size: tuple_size(coordinates)
    }
  end

  @doc """
  Demonstrates working with maps.

  ## Examples

      iex> result = ElixirTutorial.DataTypes.map_operations()
      iex> result.original
      %{name: "John", age: 30}
  """
  def map_operations do
    person = %{name: "John", age: 30}

    %{
      original: person,
      with_city: Map.put(person, :city, "New York"),
      updated_age: %{person | age: 31},
      keys: Map.keys(person),
      values: Map.values(person),
      size: map_size(person)
    }
  end

  @doc """
  Demonstrates working with strings.

  ## Examples

      iex> ElixirTutorial.DataTypes.string_operations("Hello")
      %{
        original: "Hello",
        upcase: "HELLO",
        length: 5,
        interpolated: "Hello, World!",
        split: ["H", "e", "l", "l", "o"]
      }
  """
  def string_operations(str) do
    %{
      original: str,
      upcase: String.upcase(str),
      downcase: String.downcase(str),
      length: String.length(str),
      interpolated: "#{str}, World!",
      split: String.graphemes(str),
      contains?: String.contains?(str, "ell")
    }
  end
end
