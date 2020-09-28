require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count
  
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[i(key)].include?(key)
  end

  def set(key, val)
    if include?(key)
      @store[i(key)].update(key, val)
    else
      @store[i(key)].append(key, val)
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def get(key)
    @store[i(key)].get(key)
  end

  def delete(key)
    @store[i(key)].remove(key)
    @count -= 1
  end

  def each
    @store.each do |list|
      list.each do |node|
        yield node.key, node.val
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def i(num)
    num.hash % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
    pairs = []
    self.each do |key, val|
      pairs << [key, val]
    end
    @store = Array.new(num_buckets * 2) { LinkedList.new } 
    @count = 0
    pairs.each {|pair| set(pair[0], pair[1])}
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
