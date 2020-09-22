require_relative "piece.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "nullpiece"
require_relative "pawn"

class Board
    attr_reader :rows
    def set_up_board
        board = Array.new(8) {Array.new(8)}

        board[0][0] = Rook.new(:W, self, [0,0])
        board[0][7] = Rook.new(:W, self, [0,7])
        board[0][1] = Knight.new(:W, self, [0,1])
        board[0][6] = Knight.new(:W, self, [0,6])
        board[0][2] = Bishop.new(:W, self, [0,2])
        board[0][5] = Bishop.new(:W, self, [0,5])
        board[0][3] = King.new(:W, self, [0,3])
        board[0][4] = Queen.new(:W, self, [0,4])

        (0..7).each { |i| board[1][i] = Pawn.new(:W, self, [1,i])}

        board[7][0] = Rook.new(:B, self, [7,0])
        board[7][7] = Rook.new(:B, self, [7,7])
        board[7][1] = Knight.new(:B, self, [7,1])
        board[7][6] = Knight.new(:B, self, [7,6])
        board[7][2] = Bishop.new(:B, self, [7,2])
        board[7][5] = Bishop.new(:B, self, [7,5])
        board[7][3] = King.new(:B, self, [7,3])
        board[7][4] = Queen.new(:B, self, [7,4])

        (0..7).each { |i| board[6][i] = Pawn.new(:B, self, [6,i])}

        null_piece = NullPiece.instance
        (2..5).each {|row| (0..7).each {|col| board[row][col] = null_piece}}


        board
    end

    def initialize
        @rows = set_up_board
    end

    def move_piece(color, start_pos, end_pos)
        x, y = start_pos
        raise "no piece there" unless rows[x][y].color
        piece = rows[x][y]
        raise "not a valid ending position" if !valid_pos?(end_pos)
        end_x, end_y = end_pos
        rows[end_x][end_y] = piece
        rows[x][y] = nil
    end

    def valid_pos?(pos)
        pos.all? {|coord| coord.between?(0,7)}
    end

    # private
end

# board = Board.new
# p board.rows