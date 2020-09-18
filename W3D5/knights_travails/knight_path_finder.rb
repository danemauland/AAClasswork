require_relative "../polytreenode/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node
    def self.valid_moves(pos)
        adders = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
        moves = []
        adders.each do |adder|
            move = [pos[0] + adder[0], pos[1] + adder[1]]
            moves << move if move.all? {|i| i > -1 && i < 8}
        end
        moves
    end

    def initialize(pos)
        @starting_pos = pos
        @root_node = PolyTreeNode.new(@starting_pos)
        @considered_positions = [@starting_pos]
    end

    def build_move_tree(ending_pos)
        queue = [@root_node]
        until queue.empty?
            node = queue.shift
            new_positions = new_move_positions(node.value)
            new_positions.each do |pos|
                new_node = PolyTreeNode.new(pos)
                new_node.parent = node
                queue << new_node
            end
        end
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos).reject {|position| @considered_positions.include?(position)}
        @considered_positions.concat(new_positions)
        new_positions
    end
    
end