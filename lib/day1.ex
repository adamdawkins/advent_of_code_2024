defmodule Day1 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
  end
  def part1 do
  end

  def part2(_input) do
    "Part 2"
  end
end
