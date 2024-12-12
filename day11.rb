require "benchmark" 
class Day11
  attr_accessor :stones, :counts

    def self.part1(stones)
     new(stones, 25).blink
    end
    def self.part2(stones)
     new(stones, 75).blink
    end

  def initialize(stones, steps)
    @stones = stones
    @steps = steps
    @cache = {}
    stones.each do |stone|
      @cache[stone.to_s] = {"#{steps}": 1 }
    end
  end

  def blink
    @stones.map { |stone| count(stone, @steps) }.sum
  end

  def count(stone,  steps)
    if @cache.fetch(stone.to_s, {}).fetch(steps.to_s, nil)
      print "c"
      return @cache[stone.to_s][steps.to_s]
    else
    print "."
    end

    if steps.zero?
      result = 1
    elsif stone.zero?
      result = count(1, steps - 1)

    elsif stone.to_s.size.even?
      half = stone.to_s.size / 2
      left, right = stone.to_s.chars.each_slice(half).map(&:join).map(&:to_i)
      result = count(left, steps - 1) + count(right, steps - 1)
    else
      result = count(stone * 2024, steps - 1)
    end
    cache(stone, steps, result)
    result 
  end

  def cache(stone, steps, result)
    @cache[stone.to_s] ||= {}
    @cache[stone.to_s][steps.to_s] = result
  end
end

input = [8793800,1629,65,5,960,0,138983,85629]
puts Benchmark.measure { puts Day11.new(input, 7250).blink }


