defmodule Day4Test do
  use ExUnit.Case
  alias Day4

  # Crossword:
  # MMMSXXMASM
  # MSAMXMSMSA
  # AMXSXMAAMM
  # MSAMASMSMX
  # XMASAMXAMM
  # XXAMMXXAMA
  # SMSMSASXSS
  # SAXAMASAAA
  # MAMMMXMMMM
  # MXMXAXMASX
  #
  # XMAS occurs 18 times in the crossword.
  test "counting the number of occurances of 'XMAS' in the crossword" do
    input =
      [
        "MMMSXXMASM",
        "MSAMXMSMSA",
        "AMXSXMAAMM",
        "MSAMASMSMX",
        "XMASAMXAMM",
        "XXAMMXXAMA",
        "SMSMSASXSS",
        "SAXAMASAAA",
        "MAMMMXMMMM",
        "MXMXAXMASX"
      ]
      |> Enum.map(&String.graphemes/1)

    assert Day4.part1(input) == 18
  end
end
