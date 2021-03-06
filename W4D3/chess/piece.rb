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

    def to_s
       symbol.to_s 
    end

    def empty?
        false
    end

    def pos=(val)
        @pos = val
    end

    def valid_moves
        moves.reject {|move| move_into_check?(move)}
    end

    def move_into_check?(end_pos)
        new_board = board.dup
        new_board.move_piece!(color, pos, end_pos)
        new_board.in_check?(color)
    end

    def board=(new_board)
        @board = new_board
    end

end