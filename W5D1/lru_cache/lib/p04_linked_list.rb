class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    node = @head.next
    loop do
      return node.val if node.key == key
      return nil if node.val == nil
      node = node.next
    end
  end

  def include?(key)
    !get(key).nil?
  end

  def append(key, val)
    node = Node.new(key, val)
    node.prev = @tail.prev
    @tail.prev.next = node
    @tail.prev = node
    node.next = @tail
  end

  def update(key, val)
    node = @head.next
    until node.key == key
      return nil if node.val == nil
      node = node.next
    end
    node.val = val
  end

  def remove(key)
    node = @head.next
    until node.key == key
      return nil if node.val == nil
      node = node.next
    end
    node.remove
  end

  def each
    node = @head.next
    until node.next == nil
      yield node
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

