defmodule Day3 do
  def load_input(filename) do
    File.read!(filename)
  end

  def part1(input) do
    regex = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    Regex.scan(regex, input)
    |> Enum.map(fn [_, x, y] -> String.to_integer(x) * String.to_integer(y) end)
    |> Enum.sum()
  end

  def part2(_input) do
    "Part 2"
  end
end
