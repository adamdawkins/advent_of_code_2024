defmodule Day9 do
  def load_input(filename) do
    File.read!(filename)
    |> String.to_integer()
    |> Integer.digits()
  end

  def part1(input) do
    input
    |> expand_map()
    |> compress_disk()
    |> checksum()
  end

  def part2(_input) do
  end

  def checksum(disk) do
    disk
    |> Enum.with_index()
    |> Enum.reduce(0, fn
      # skip empty spaces
      {nil, _}, acc -> acc
      {block_id, position}, acc -> acc + block_id * position
    end)
  end

  def expand_map(input) do
    input
    |> Enum.chunk_every(2)
    |> Enum.with_index()
    |> Enum.flat_map(&expand_chunk/1)
  end

  def compress_disk(disk) do
    move_file(disk)
  end

  defp expand_chunk({chunk, id}) do
    case chunk do
      [file, space] ->
        expand_file(file, id) ++ expand_space(space)

      [file] ->
        expand_file(file, id)
    end
  end

  defp expand_file(file, id) do
    List.duplicate(id, file)
  end

  defp expand_space(space) do
    List.duplicate(nil, space)
  end

  defp move_file(disk) do
    case {last_file(disk), first_space(disk)} do
      # No file to move
      {nil, _space_index} ->
        disk

      # No space to move into
      {_last_file_index, nil} ->
        disk

      # our last file is before all the empty spaces
      {last_file_index, space_index} when last_file_index < space_index ->
        disk

      {last_file_index, space_index} ->
        updated_disk =
          disk
          |> List.replace_at(space_index, Enum.at(disk, last_file_index))
          |> List.delete_at(last_file_index)

        if updated_disk == disk do
          disk
        else
          move_file(updated_disk)
        end
    end
    |> Enum.reject(&is_nil/1)
  end

  defp last_file(disk) do
    disk
    |> Enum.reverse()
    |> Enum.find_index(fn x -> x != nil end)
    |> case do
      nil -> nil
      reversed_index -> length(disk) - 1 - reversed_index
    end
  end

  defp first_space(disk) do
    Enum.find_index(disk, fn x -> x == nil end)
  end
end
