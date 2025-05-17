defmodule SigilsPracticeTest do
  use ExUnit.Case
  doctest SigilsPractice

  test "greets the world" do
    assert SigilsPractice.hello() == :world
  end
end
