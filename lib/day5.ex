defmodule Day5 do
  def load_input(filename) do
    lines =
      File.read!(filename)
      |> String.split("\n", trim: true)

    Enum.reduce(lines, {[], []}, fn line, {ordering_rules, updates} ->
      cond do
        String.contains?(line, "|") ->
          {[to_rule(line) | ordering_rules], updates}

        String.contains?(line, ",") ->
          {ordering_rules, [to_page(line) | updates]}

        true ->
          {ordering_rules, updates}
      end
    end)
  end

  def part1({ordering_rules, updates}) do
    updates
    |> Enum.filter(&correct_order?(ordering_rules, &1))
    |> Enum.map(&middle_page_number(&1))
    |> Enum.sum()
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

  defp middle_page_number(update) do
    case length(update) do
      # Return nil for empty array
      0 -> nil
      # Get the middle element
      len -> Enum.at(update, div(len, 2))
    end
  end

  defp to_page(line) do
    line
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  defp to_rule(line) do
    line
    |> String.split("|")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end
end
