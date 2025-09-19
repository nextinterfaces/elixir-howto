defmodule ElixirTutorial.DataTypesTest do
  use ExUnit.Case
  doctest ElixirTutorial.DataTypes

  alias ElixirTutorial.DataTypes

  describe "integer_examples/0" do
    test "returns various integer formats" do
      result = DataTypes.integer_examples()

      assert result.basic == 42
      assert result.binary == 10
      assert result.octal == 420
      assert result.hex == 255
      assert result.large == 1_000_000
    end
  end

  describe "atom_examples/0" do
    test "returns list of atoms" do
      result = DataTypes.atom_examples()

      assert :ok in result
      assert :error in result
      assert :hello_world in result
      assert true in result
      assert false in result
      assert nil in result
    end
  end

  describe "list_operations/1" do
    test "performs various list operations" do
      input = [1, 2, 3]
      result = DataTypes.list_operations(input)

      assert result.original == [1, 2, 3]
      assert result.head == 1
      assert result.tail == [2, 3]
      assert result.prepend == [0, 1, 2, 3]
      assert result.append == [1, 2, 3, 4]
      assert result.length == 3
    end

    test "handles single element list" do
      input = [42]
      result = DataTypes.list_operations(input)

      assert result.head == 42
      assert result.tail == []
      assert result.length == 1
    end
  end

  describe "tuple_examples/0" do
    test "demonstrates tuple operations" do
      result = DataTypes.tuple_examples()

      assert result.coordinates == {3, 4}
      assert result.result == {:ok, "Success"}
      assert result.error == {:error, "Something went wrong"}
      assert result.size == 2
    end
  end

  describe "map_operations/0" do
    test "performs various map operations" do
      result = DataTypes.map_operations()

      assert result.original == %{name: "John", age: 30}
      assert result.with_city == %{name: "John", age: 30, city: "New York"}
      assert result.updated_age == %{name: "John", age: 31}
      assert result.keys == [:age, :name] or result.keys == [:name, :age]
      assert result.values == [30, "John"] or result.values == ["John", 30]
      assert result.size == 2
    end
  end

  describe "string_operations/1" do
    test "performs various string operations" do
      result = DataTypes.string_operations("Hello")

      assert result.original == "Hello"
      assert result.upcase == "HELLO"
      assert result.downcase == "hello"
      assert result.length == 5
      assert result.interpolated == "Hello, World!"
      assert result.split == ["H", "e", "l", "l", "o"]
      assert result.contains? == true
    end

    test "handles empty string" do
      result = DataTypes.string_operations("")

      assert result.original == ""
      assert result.upcase == ""
      assert result.downcase == ""
      assert result.length == 0
      assert result.split == []
      assert result.contains? == false
    end
  end
end
