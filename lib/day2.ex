defmodule Day2 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
  end

  def part1(input) do
    input
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.map(fn report -> Enum.map(report, &String.to_integer/1) end)
    |> Enum.map(&strictly_monotonic?/1)
  end

  def part2(_input) do
    "Part 2"
  end

  defp strictly_monotonic?([]), do: true
  defp strictly_monotonic?([_]), do: true

  defp strictly_monotonic?(list) do
    strictly_increasing?(list) || strictly_decreasing?(list)
  end

  defp strictly_increasing?(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a < b end)
  end

  defp strictly_decreasing?(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a > b end)
  end
end
