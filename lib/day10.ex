defmodule Day10 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  def part1(grid) do
    initial_coords = coordinates_of_digit(grid, 0)

    max_digit = grid |> Enum.flat_map(& &1) |> Enum.max()

    initial_coords
    |> Enum.map(fn coord ->
      paths(grid, [coord], 1, max_digit)
    end)
    |> Enum.map(&Enum.uniq/1)
    |> Enum.map(&length/1)
    |> Enum.sum()
  end

  def part2(_input) do
    "Day 10 Part 2"
  end

  defp digit_at(grid, {x, y}) do
    Enum.at(grid, y) |> Enum.at(x)
  end

  defp paths(_grid, coords, target_digit, max_digit) when target_digit > max_digit do
    coords
  end

  defp paths(grid, coords, target_digit, max_digit) do
    new_coords =
      coords
      |> Enum.flat_map(fn coord -> neighbours(grid, coord) end)
      |> Enum.filter(fn coord -> digit_at(grid, coord) == target_digit end)

    paths(grid, new_coords, target_digit + 1, max_digit)
  end

  defp neighbours(grid, {x, y}) do
    [
      {x, y - 1},
      {x, y + 1},
      {x - 1, y},
      {x + 1, y}
    ]
    |> Enum.filter(fn {x, y} -> in_bounds?(grid, {x, y}) end)
  end

  defp coordinates_of_digit(grid, digit) do
    grid
    |> Enum.with_index()
    |> Enum.flat_map(fn {row, y} ->
      row
      |> Enum.with_index()
      |> Enum.filter(fn {cell, _} -> cell == digit end)
      |> Enum.map(fn {_, x} -> {x, y} end)
    end)
  end

  defp in_bounds?(grid, {x, y}) do
    x >= 0 and y >= 0 and x < length(List.first(grid)) and y < length(grid)
  end
end
