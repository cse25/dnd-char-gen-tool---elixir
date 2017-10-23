defmodule DndTest do
  use ExUnit.Case
  doctest Dnd

  test "greets the world" do
    assert Dnd.hello() == :world
  end
end
