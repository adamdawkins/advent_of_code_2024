defmodule Day6 do
  def load_input(filename) do
    map =
      File.read!(filename)
      |> String.split("\n", trim: true)

    parse_map(map)
  end

  def part1({map, row, col, direction}) do
    directions = %{
      "^" => {-1, 0},
      ">" => {0, 1},
      "v" => {1, 0},
      "<" => {0, -1}
    }

    turn_right = %{
      "^" => ">",
      ">" => "v",
      "v" => "<",
      "<" => "^"
    }

    visited = MapSet.new([{row, col}])

    simulate_path(map, row, col, direction, directions, turn_right, visited)
  end

  def part2(_input) do
    "Part 2"
  end

  defp simulate_path(map, row, col, direction, directions, turn_right, visited) do
    case move_guard(map, {row, col}, direction, directions, turn_right) do
      {:out_of_bounds} ->
        MapSet.size(visited)

      {:continue, {new_row, new_col, new_direction}} ->
        new_visited = MapSet.put(visited, {new_row, new_col})
        simulate_path(map, new_row, new_col, new_direction, directions, turn_right, new_visited)
    end
  end

  defp move_guard(map, {row, col}, direction, directions, turn_right) do
    {d_row, d_col} = directions[direction]
    {new_row, new_col} = {row + d_row, col + d_col}

    if out_of_bounds?(map, new_row, new_col) do
      {:out_of_bounds}
    else
      case Enum.at(map, new_row) |> String.at(new_col) do
        "#" -> {:continue, {row, col, turn_right[direction]}}
        _ -> {:continue, {new_row, new_col, direction}}
      end
    end
  end

  defp out_of_bounds?(map, row, col) do
    row < 0 or col < 0 or row >= length(map) or col >= String.length(Enum.at(map, 0))
  end

  defp parse_map(map) do
    {row, col, direction} =
      Enum.reduce_while(map, {0, 0, nil}, fn line, {r, _, nil} ->
        case find_guard(line) do
          nil -> {:cont, {r + 1, 0, nil}}
          {c, char} -> {:halt, {r, c, char}}
        end
      end)

    {map, row, col, direction}
  end

  defp find_guard(line) do
    Enum.find_value(0..(String.length(line) - 1), fn index ->
      char = String.at(line, index)
      if char in ["^", "v", "<", ">"], do: {index, char}, else: nil
    end)
  end
end
