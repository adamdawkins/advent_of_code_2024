require Integer

defmodule Day11 do
  def load_input(filename) do
    File.read!(filename)
    |> String.split("\s", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part1(input) do
    Enum.reduce(1..25, input, fn _i, acc ->
      blink(acc)
    end)
    |> Enum.count()
  end

  def part2(_input) do
    "Part 2"
  end

  def blink(stones) do
    stones
    |> Enum.flat_map(&blink_stone/1)
  end

  defp blink_stone(0), do: [1]

  defp blink_stone(n) do
    if even_number_of_digits?(n) do
      split_in_half(n)
    else
      [n * 2024]
    end
  end

  defp even_number_of_digits?(n) do
    Integer.digits(n)
    |> length()
    |> Integer.is_even()
  end

  defp split_in_half(n) do
    digits = Integer.digits(n)
    half = div(length(digits), 2)
    {left, right} = Enum.split(digits, half)

    [left, right]
    |> Enum.map(fn digits ->
      digits |> Enum.join() |> String.to_integer()
    end)
  end
end
