defmodule Day9Test do
  use ExUnit.Case
  alias Day9

  # 2333133121414131402 The disk map uses a dense format to represent the
  # layout of files and free space on the disk. The digits alternate between
  # indicating the length of a file and the length of free space.

  # So, a disk map like 12345 would represent a one-block file, two blocks of
  # free space, a three-block file, four blocks of free space, and then a
  # five-block file. A disk map like 90909 would represent three nine-block
  # files in a row (with no free space between them).

  # Each file on disk also has an ID number based on the order of the files as
  # they appear before they are rearranged, starting with ID 0. So, the disk
  # map 12345 has three files: a one-block file with ID 0, a three-block file
  # with ID 1, and a five-block file with ID 2. Using one character for each
  # block where digits are the file ID and . is free space, the disk map 12345
  # represents these individual blocks:

  # 0..111....22222

  test "expand_map" do
    input = [1, 2, 3, 4, 5]
    assert Day9.expand_map(input) == [0, nil, nil, 1, 1, 1, nil, nil, nil, nil, 2, 2, 2, 2, 2]
  end

  # The first example above, 2333133121414131402, represents
  # these individual blocks:

  # 00...111...2...333.44.5555.6666.777.888899

  # The amphipod would like to move
  # file blocks one at a time from the end of the disk to the leftmost free
  # space block (until there are no gaps remaining between file blocks). For
  # the disk map 12345, the process looks like this:

  # 0..111....22222
  # 02.111....2222.
  # 022111....222..
  # 0221112...22...
  # 02211122..2....
  # 022111222......

  test "compress disk" do
    input = [0, nil, nil, 1, 1, 1, nil, nil, nil, nil, 2, 2, 2, 2, 2]
    assert Day9.compress_disk(input) == [0, 2, 2, 1, 1, 1, 2, 2, 2]

    assert Day9.expand_map([2, 3, 3, 3, 1, 3, 3, 1, 2, 1, 4, 1, 4, 1, 3, 1, 4, 0, 2])
           |> Day9.compress_disk()
           |> Enum.map(&Integer.to_string/1)
           |> Enum.join() == "0099811188827773336446555566"

    # Converted this one to a string because the Elixir formatter likes to
    # split long arrays into multiple lines
  end
end
