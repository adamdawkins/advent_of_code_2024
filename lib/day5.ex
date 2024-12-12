defmodule Day5 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
  end

  def part1(_input) do
    "Part 1"
  end

  def part2(_input) do
    "Part 2"
  end

  def correct_order?(ordering_rules, update) do
    Enum.all?(ordering_rules, fn {a, b} ->
      case {Enum.find_index(update, &(&1 == a)), Enum.find_index(update, &(&1 == b))} do
        {nil, _} -> true
        {_, nil} -> true
        {a, b} -> a < b
      end
    end)
  end
end
