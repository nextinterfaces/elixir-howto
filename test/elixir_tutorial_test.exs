defmodule ElixirTutorialTest do
  use ExUnit.Case
  doctest ElixirTutorial

  describe "hello/1" do
    test "returns default greeting" do
      assert ElixirTutorial.hello() == "Hello, World!"
    end

    test "returns custom greeting" do
      assert ElixirTutorial.hello("Elixir") == "Hello, Elixir!"
    end

    test "handles empty string" do
      assert ElixirTutorial.hello("") == "Hello, !"
    end
  end

  describe "calculate/3" do
    test "performs addition" do
      assert ElixirTutorial.calculate(:add, 5, 3) == 8
    end

    test "performs subtraction" do
      assert ElixirTutorial.calculate(:subtract, 10, 4) == 6
    end

    test "performs multiplication" do
      assert ElixirTutorial.calculate(:multiply, 6, 7) == 42
    end

    test "performs division" do
      assert ElixirTutorial.calculate(:divide, 15, 3) == 5.0
    end

    test "handles division by zero" do
      assert ElixirTutorial.calculate(:divide, 10, 0) == {:error, "Cannot divide by zero"}
    end

    test "handles unknown operation" do
      assert ElixirTutorial.calculate(:unknown, 1, 2) == {:error, "Unknown operation"}
    end
  end

  describe "describe_data/1" do
    test "describes integers" do
      assert ElixirTutorial.describe_data(42) == "This is an integer: 42"
    end

    test "describes strings" do
      assert ElixirTutorial.describe_data("hello") == "This is a string: hello"
    end

    test "describes lists" do
      assert ElixirTutorial.describe_data([1, 2, 3]) == "This is a list with 3 elements"
    end

    test "describes maps" do
      assert ElixirTutorial.describe_data(%{a: 1, b: 2}) == "This is a map with 2 keys"
    end

    test "describes tuples" do
      assert ElixirTutorial.describe_data({1, 2}) == "This is a tuple with 2 elements"
    end

    test "describes unknown types" do
      assert ElixirTutorial.describe_data(:atom) == "This is some other data type"
    end
  end
end
