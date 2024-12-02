defmodule Day1 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
  end

  def part1(input) do
    input
    |> parse_input()
    |> sort_and_zip()
    |> Enum.map(fn {a, b} -> abs(b - a) end)
    |> Enum.sum()
  end

  def part2(input) do
    {left, right} = input |> parse_input() |> Enum.unzip()

    Enum.map(left, fn x ->
      Enum.count(right, &(&1 == x)) * x
    end)
    |> Enum.sum()
  end

  defp parse_input(input) do
    input
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
  end

  # Helper function to sort and zip the lists
  defp sort_and_zip(parsed) do
    {left, right} = Enum.unzip(parsed)
    Enum.zip(Enum.sort(left), Enum.sort(right))
  end
end
