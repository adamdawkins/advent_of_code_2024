defmodule Day4 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  def part1(input) do
    x_positions = find_char_positions("X", input)

    Enum.flat_map(x_positions, fn {row, col} ->
      Enum.map(directions(), fn {dx, dy} ->
        matches_word?(input, "XMAS", {row, col}, {dx, dy})
      end)
    end)
    |> Enum.count(& &1)
  end

  def part2(_input) do
    "Day 4 Part 2"
    # a_positions = find_char_positions("A", input)

    # Enum.flat_map(a_positions, fn {row, col} ->
    #   Enum.map(directions(), fn {dx, dy} ->
    #     matches_x_mas?(input, {row, col}, {dx, dy})
    #   end)
    # end)
    # |> Enum.count(& &1)
  end

  defp find_char_positions(char, grid) do
    for row <- 0..(length(grid) - 1),
        col <- 0..(length(List.first(grid)) - 1),
        Enum.at(grid, row) |> Enum.at(col) == char,
        do: {row, col}
  end

  defp matches_word?(grid, word, {row, col}, {dx, dy}) do
    word
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.all?(fn {letter, index} ->
      new_row = row + index * dx
      new_col = col + index * dy

      in_bounds?(grid, {new_row, new_col}) and
        Enum.at(grid, new_row) |> Enum.at(new_col) == letter
    end)
  end

  def matches_x_mas?(grid, {row, col}, {dx, dy}) do
    "MAS"
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.all?(fn {letter, index} ->
      new_row = row + index * dx
      new_col = col + index * dy

      in_bounds?(grid, {new_row, new_col}) and
        Enum.at(grid, new_row) |> Enum.at(new_col) == letter
    end)
  end

  defp in_bounds?(grid, {row, col}) do
    row >= 0 && row < length(grid) && col >= 0 && col < length(List.first(grid))
  end

  defp directions do
    [
      # Right
      {0, 1},
      # Down
      {1, 0},
      # Left
      {0, -1},
      # Up
      {-1, 0},
      # Diagonal down-right
      {1, 1},
      # Diagonal up-left
      {-1, -1},
      # Diagonal down-left
      {-1, 1},
      # Diagonal up-right
      {1, -1}
    ]
  end
end
