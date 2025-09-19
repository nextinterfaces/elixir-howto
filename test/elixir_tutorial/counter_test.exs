defmodule ElixirTutorial.CounterTest do
  use ExUnit.Case
  doctest ElixirTutorial.Counter

  alias ElixirTutorial.Counter

  setup do
    {:ok, counter} = Counter.start_link([])
    %{counter: counter}
  end

  describe "initial state" do
    test "starts with counter at 0", %{counter: counter} do
      assert Counter.get(counter) == 0
    end
  end

  describe "increment/1" do
    test "increments counter by 1", %{counter: counter} do
      assert Counter.get(counter) == 0

      Counter.increment(counter)
      # Give the cast time to process
      Process.sleep(10)

      assert Counter.get(counter) == 1
    end

    test "multiple increments work", %{counter: counter} do
      Counter.increment(counter)
      Counter.increment(counter)
      Counter.increment(counter)

      # Give the casts time to process
      Process.sleep(10)

      assert Counter.get(counter) == 3
    end
  end

  describe "increment_by/2" do
    test "increments counter by specified amount", %{counter: counter} do
      Counter.increment_by(counter, 5)

      # Give the cast time to process
      Process.sleep(10)

      assert Counter.get(counter) == 5
    end

    test "can increment by negative numbers", %{counter: counter} do
      Counter.increment_by(counter, 10)
      Counter.increment_by(counter, -3)

      # Give the casts time to process
      Process.sleep(10)

      assert Counter.get(counter) == 7
    end
  end

  describe "reset/1" do
    test "resets counter to 0", %{counter: counter} do
      Counter.increment_by(counter, 42)
      Process.sleep(10)

      assert Counter.get(counter) == 42

      Counter.reset(counter)
      Process.sleep(10)

      assert Counter.get(counter) == 0
    end
  end

  describe "concurrent access" do
    test "handles concurrent increments correctly", %{counter: counter} do
      # Spawn multiple processes that increment concurrently
      tasks = for _i <- 1..10 do
        Task.async(fn ->
          Counter.increment(counter)
        end)
      end

      # Wait for all tasks to complete
      Enum.each(tasks, &Task.await/1)

      # Give all casts time to process
      Process.sleep(50)

      assert Counter.get(counter) == 10
    end
  end
end
