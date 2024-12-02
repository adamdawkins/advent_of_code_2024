defmodule AoCRunner do
  def main(args) do
    [day_str | _] = args
    day = String.to_integer(day_str)
    run(day)
  end

  def run(day) do
    module = Module.concat(Elixir, "Day#{day}")
    input_file = "inputs/day_#{day}.txt"

    if File.exists?(input_file) do
      input = module.load_input(input_file)
      IO.puts("Part 1: #{module.part1(input)}")
      IO.puts("Part 2: #{module.part2(input)}")
    else
      IO.puts("Input file not found: #{input_file}")
    end
  end
end
