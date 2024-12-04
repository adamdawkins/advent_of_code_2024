defmodule Day3 do
  def load_input(filename) do
    File.read!(filename)
  end

  def part1(input) do
    regex = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    Regex.scan(regex, input)
    |> extract_numbers()
    |> multiply_and_sum()
  end

  def part2(input) do
    input
    |> process_commands()
    |> extract_numbers()
    |> multiply_and_sum()
  end

  defp process_commands(input) do
    regex = ~r/mul\((\d{1,3}),(\d{1,3})\)/
    sections = Regex.split(~r/do\(\)|don't\(\)/, input, trim: true, include_captures: true)

    # Process sections alternately
    sections
    |> process_sections(true)
    |> Enum.flat_map(&Regex.scan(regex, &1))
  end

  # don't do anything when the section is an empty list
  defp process_sections([], _enabled), do: []

  # When the next token (marker) is 'do()', enable the processor and process the next section
  defp process_sections([marker | rest], _enabled) when marker == "do()" do
    [hd(rest) | process_sections(tl(rest), true)]
  end

  # When the next token (marker) is 'don't()', disable the processor and process the next section
  defp process_sections([marker | rest], _enabled) when marker == "don't()" do
    process_sections(tl(rest), false)
  end

  # When the next token (content) is anything else, carry on
  defp process_sections([content | rest], enabled) do
    [content | process_sections(rest, enabled)]
  end

  defp extract_numbers(regex_result) do
    Enum.map(regex_result, fn [_full, num1, num2] ->
      {String.to_integer(num1), String.to_integer(num2)}
    end)
  end

  defp multiply_and_sum(numbers) do
    numbers
    |> Enum.map(fn {x, y} -> x * y end)
    |> Enum.sum()
  end
end
