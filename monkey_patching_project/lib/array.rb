# Monkey-Patch Ruby's existing Array class to add your own custom methods

require "byebug"
class Array
  # PART 1
  def span
    self.empty? ? nil : self.max - self.min
  end

  def average
    self.empty? ? nil : self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.empty?

    if self.length.odd?
        mid = self.length / 2
        self.sort[mid]
    else
        sorted = self.sort
        mid = self.length / 2
        n1 = sorted[mid]
        n2 = sorted[mid - 1]
        return (n1 + n2) / 2.0
    end
  end

  def counts
    hash = Hash.new(0)
    self.each { |el| hash[el] += 1 }
    hash
  end

  #part2

  def my_count(ele)
    count = 0
    self.each { |el| count += 1 if el == ele }
    count
  end

  def my_index(ele)
    self.each_with_index { |el, i| return i if el == ele }
    return nil
  end

  def my_uniq
    # new_arr = []
    # self.each { |el| new_arr << el if !new_arr.include?(el) }
    # new_arr
    hash = {}
    self.each { |el| hash[el] = true }
    hash.keys
  end

  def my_transpose
    rows = self.length
    cols = self[0].length
    arr = Array.new(rows) {[0] * cols }
    (0...rows).each do |r|
        (0...cols).each do |c|
            arr[r][c] = self[c][r]
        end
    end

    arr
  end
end
