class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @store.length || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[i(num)] << num
  end

  def remove(num)
    @store[i(num)].delete(num)
  end

  def include?(num)
    @store[i(num)].include?(num)
  end

  private

  def i(num)
    num % num_buckets
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet < IntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if include?(num)
    super
    @count += 1
    resize! if count == num_buckets
  end

  def remove(num)
    return if !include?(num)
    super
    @count -= 1
  end

  private
  def i(num)
    num % num_buckets
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    oldstore = @store.flatten
    @count = 0
    @store = Array.new(num_buckets * 2) {Array.new}
    oldstore.each {|ele| insert(ele) }
  end
end
