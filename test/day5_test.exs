defmodule Day5Test do
  use ExUnit.Case
  alias Day5

  # 47|53
  # 97|13
  # 97|61
  # 97|47
  # 75|29
  # 61|13
  # 75|53
  # 29|13
  # 97|29
  # 53|29
  # 61|53
  # 97|53
  # 61|29
  # 47|13
  # 75|47
  # 97|75
  # 47|61
  # 75|61
  # 47|29
  # 75|13
  # 53|13

  # 75,47,61,53,29
  # 97,61,53,29,13
  # 75,29,13
  # 75,97,47,61,53
  # 61,13,29
  # 97,13,75,29,47

  # The first section specifies the page ordering rules, one per
  # line. The first rule, 47|53, means that if an update includes both page
  # number 47 and page number 53, then page number 47 must be printed at some
  # point before page number 53. (47 doesn't necessarily need to be immediately
  # before 53; other pages are allowed to be between them.)

  # The second section specifies the page numbers of each update. Because most
  # safety manuals are different, the pages needed in the updates are different
  # too. The first update, 75,47,61,53,29, means that the update consists of
  # page numbers 75, 47, 61, 53, and 29.

  # To get the printers going as soon as possible, start by identifying which
  # updates are already in the right order.

  # In the above example, the first update (75,47,61,53,29) is in the right
  # order:

  test "says the first update is in the correct order" do
    ordering_rules = [
      {47, 53},
      {97, 13},
      {97, 61},
      {97, 47},
      {75, 29},
      {61, 13},
      {75, 53},
      {29, 13},
      {97, 29},
      {53, 29},
      {61, 53},
      {97, 53},
      {61, 29},
      {47, 13},
      {75, 47},
      {97, 75},
      {47, 61},
      {75, 61},
      {47, 29},
      {75, 13},
      {53, 13}
    ]

    assert Day5.correct_order?(ordering_rules, [75, 47, 61, 53, 29]) == true
  end

  # 75 is correctly first because there are rules that put each other page
  # after it: 75|47, 75|61, 75|53, and 75|29. 47 is correctly second because 75
  # must be before it (75|47) and every other page must be after it according
  # to 47|61, 47|53, and 47|29. 61 is correctly in the middle because 75 and 47
  # are before it (75|61 and 47|61) and 53 and 29 are after it (61|53 and
  # 61|29). 53 is correctly fourth because it is before page number 29 (53|29).
  # 29 is the only page left and so is correctly last. Because the first update
  # does not include some page numbers, the ordering rules involving those
  # missing page numbers are ignored.

  # The second and third updates are also in the correct order according to the
  # rules. Like the first update, they also do not include every page number,
  # and so only some of the ordering rules apply - within each update, the
  # ordering rules that involve missing page numbers are not used.

  # The fourth update, 75,97,47,61,53, is not in the correct order: it would
  # print 75 before 97, which violates the rule 97|75.
  test "says the fourth update is not in the correct order" do
    ordering_rules = [
      {47, 53},
      {97, 13},
      {97, 61},
      {97, 47},
      {75, 29},
      {61, 13},
      {75, 53},
      {29, 13},
      {97, 29},
      {53, 29},
      {61, 53},
      {97, 53},
      {61, 29},
      {47, 13},
      {75, 47},
      {97, 75},
      {47, 61},
      {75, 61},
      {47, 29},
      {75, 13},
      {53, 13}
    ]

    assert Day5.correct_order?(ordering_rules, [75, 97, 47, 61, 53]) == false
  end

  # The fifth update, 61,13,29, is also not in the correct order, since it
  # breaks the rule 29|13.

  # The last update, 97,13,75,29,47, is not in the correct order due to
  # breaking several rules.
  #
  # Return the sum of the middle numbers of the updates in the correct order:
  test "part 1" do
    ordering_rules = [
      {47, 53},
      {97, 13},
      {97, 61},
      {97, 47},
      {75, 29},
      {61, 13},
      {75, 53},
      {29, 13},
      {97, 29},
      {53, 29},
      {61, 53},
      {97, 53},
      {61, 29},
      {47, 13},
      {75, 47},
      {97, 75},
      {47, 61},
      {75, 61},
      {47, 29},
      {75, 13},
      {53, 13}
    ]

    updates = [
      [75, 47, 61, 53, 29],
      [97, 61, 53, 29, 13],
      [75, 29, 13],
      [75, 97, 47, 61, 53],
      [61, 13, 29],
      [97, 13, 75, 29, 47]
    ]

    assert Day5.part1({ordering_rules, updates}) == 143
  end
end
