defmodule Day11Test do
  use ExUnit.Case
  alias Day11

  #   If the stone is engraved with the number 0, it is replaced by a stone
  #   engraved with the number 1. If the stone is engraved with a number that has
  #   an even number of digits, it is replaced by two stones. The left half of
  #   the digits are engraved on the new left stone, and the right half of the
  #   digits are engraved on the new right stone. (The new numbers don't keep
  #   extra leading zeroes: 1000 would become stones 10 and 0.) If none of the
  #   other rules apply, the stone is replaced by a new stone; the old stone's
  #   number multiplied by 2024 is engraved on the new stone.
  # If you have an arrangement of five stones engraved with the numbers
  # 0 1 10 99 999
  # and you blink once, the stones transform as follows:

  # So, after blinking once, your five stones would become an arrangement of
  # seven stones engraved with the numbers
  # 1 2024 1 0 9 9 2021976.

  test "part1" do
    input = [125, 17]
    assert Day11.part1(input) == 55312
  end
end
