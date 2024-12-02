defmodule Day2 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
  end

  def part1(input) do
    input
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.map(fn report -> Enum.map(report, &String.to_integer/1) end)
    |> Enum.map(&strictly_monotonic_and_gradual?/1)
  end

  def part2(_input) do
    "Part 2"
  end

  defp strictly_monotonic_and_gradual?(list) do
    {inc, dec, gradual} =
      Enum.chunk_every(list, 2, 1, :discard)
      |> Enum.reduce(
        {true, true, true},
        fn [a, b], {strictly_increasing, strictly_decreasing, gradual} ->
          {strictly_increasing && a < b, strictly_decreasing && a > b, gradual && abs(b - a) <= 3}
        end
      )

    (inc || dec) && gradual
  end
end
