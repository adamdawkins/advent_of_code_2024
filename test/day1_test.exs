defmodule Day1Test do
  use ExUnit.Case
  alias Day1

  test "calculates the correct sum of differences" do
    input = [
      "3   4",
      "4   3",
      "2   5",
      "1   3",
      "3   9",
      "3   3"
    ]

    assert Day1.part1(input) == 11
  end

  # For these example lists, here is the process of finding the similarity
  # score:

  # The first number in the left list is 3. It appears in the right list three
  # times, so the similarity score increases by 3 * 3 = 9. The second number in
  # the left list is 4. It appears in the right list once, so the similarity
  # score increases by 4 * 1 = 4. The third number in the left list is 2. It
  # does not appear in the right list, so the similarity score does not increase
  # (2 * 0 = 0). The fourth number, 1, also does not appear in the right list.
  # The fifth number, 3, appears in the right list three times; the similarity
  # score increases by 9. The last number, 3, appears in the right list three
  # times; the similarity score again increases by 9. So, for these example
  # lists, the similarity score at the end of this process is
  # 31 (9 + 4 + 0 + 0 + 9 + 9).
  test "calculates the correct similarity score sum" do
    input = [
      "3   4",
      "4   3",
      "2   5",
      "1   3",
      "3   9",
      "3   3"
    ]

    assert Day1.part2(input) == 31
  end
end
