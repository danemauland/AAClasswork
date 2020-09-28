require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_accessor :map, :store
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if !@map.include?(key)
        val = @prc.call(key)
        @store.append(key,val)
        node = @store.last
        @map[key] = node
        if self.count > @max
          first = @store.first
          @map.delete(first.key)
          first.remove
        end
        val
    else
      update_node!(@map[key]) unless @store.last == @map[key]
      @store.last.val
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    raise "error is currently last node" if node.key == @store.last.key
    node.remove
    node.next = @store.last.next
    node.prev = @store.last
    last = @store.last
    tail = last.next
    last.next = node
    tail.prev = node
  end

  def eject!
  end
end
