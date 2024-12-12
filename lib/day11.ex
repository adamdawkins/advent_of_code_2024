require Integer

defmodule Day11 do
  def count(stone, steps, cache \\ %{}) do
    case Map.get(cache, {stone, steps}) do
      nil ->
        result = _count(stone, steps, cache)
        Map.put(cache, {stone, steps}, result)

        result

      result ->
        result
    end
  end

  def load_input(filename) do
    File.read!(filename)
    |> String.split("\s", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part1(stones) do
    Enum.map(stones, fn stone ->
      count(stone, 25)
    end)
    |> Enum.sum()
  end

  def part2(stones) do
    Enum.map(stones, fn stone ->
      count(stone, 75)
    end)
    |> Enum.sum()
  end

  defp _count(_stone, 0, _cache), do: 1
  defp _count(0, steps, cache), do: count(1, steps - 1, cache)

  defp _count(stone, steps, cache) do
    if even_number_of_digits?(stone) do
      split_in_half(stone)
      |> Enum.map(fn n -> count(n, steps - 1, cache) end)
      |> Enum.sum()
    else
      count(stone * 2024, steps - 1, cache)
    end
  end

  # def blink(stones, steps) do
  #   Enum.flat_map(stones, fn stone ->
  #     blink_stone(stone, steps)
  #   end)
  # end

  # defp blink_stone(stone, steps) do
  #   if even_number_of_digits?(stone) do
  #     split_in_half(stone)
  #   else
  #     [n * 2024]
  #   end
  # end

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
