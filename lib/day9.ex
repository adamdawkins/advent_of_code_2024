defmodule Day9 do
  def load_input(filename) do
    File.read!(filename)
    |> String.to_integer()
    |> Integer.digits()
  end

  def part1(_input) do
    IO.puts("Part 1 not implemented")
  end

  def part2(_input) do
    IO.puts("Part 2 not implemented")
  end

  def expand_map(input) do
    input
    |> Enum.chunk_every(2)
    |> Enum.with_index()
    |> Enum.flat_map(&expand_chunk/1)
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
end
