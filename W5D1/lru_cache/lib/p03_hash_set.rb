
class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      @store[i(key)] << key 
      @count += 1
    end
    resize! if @count >= num_buckets
  end

  def include?(key)
      @store[i(key)].include?(key)
  end

  def remove(key)
    if include?(key)
      @store[i(key)].delete(key) 
      @count -= 1
    end
  end

  private

  def i(key)
    key.hash % num_buckets
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      old_store = store.flatten
      @store = Array.new(num_buckets * 2) {Array.new}
      @count = 0
      old_store.each { |ele| insert(ele) }
  end
end
