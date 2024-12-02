defmodule Day1Test do
  use ExUnit.Case
  alias Day1

  test "calculates the correct sum of differences" do
    input = [
      "3   4",
      "4   3",
      "2   5",
      "1   3",
      "3   9",
      "3   3"
    ]

    assert Day1.part1(input) == 11
  end
end
