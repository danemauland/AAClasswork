class Piece
    attr_reader :color, :pos, :board
    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def symbol
        :O
    end

    def inspect
        symbol.to_s
    end

    def empty?(pos)
     
    end

end