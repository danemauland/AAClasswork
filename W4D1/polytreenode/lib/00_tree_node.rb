class PolyTreeNode
    attr_accessor :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent_arg)
        @parent.children.delete(self) if !@parent.nil?
        @parent = parent_arg
        @parent.children<<self if !@parent.nil? && !@parent.children.include?(self) 
    end

    def add_child(child)
        child.parent = self
    end


    def dfs(target)
        return self if self.value == target
        @children.each do |child|
            child_dfs = child.dfs(target) 
            return child_dfs unless child_dfs.nil?
        end
        nil
         
    end

    def bfs(target)
        queue = [self]
        
        
        until queue.empty?
            node = queue.shift
            return node if node.value == target
            queue.concat(node.children)
        end

        nil
    end

    def remove_child(child)
        raise "Node is not a child" if !@children.include?(child)
        child.parent = nil
    end

    def inspect
        @value
    end


    
end