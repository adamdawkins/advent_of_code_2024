defmodule Day1 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
  end

  def part1(input) do
    input
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    |> Enum.unzip()
    |> then(fn {list1, list2} ->
      Enum.zip(Enum.sort(list1), Enum.sort(list2))
    end)
    |> Enum.map(fn {a, b} -> abs(b - a) end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    |> Enum.unzip()
    |> then(fn {list1, list2} ->
      Enum.map(list1, fn x ->
        Enum.count(list2, fn y -> y == x end) * x
      end)
    end)
    |> Enum.sum()
  end
end
