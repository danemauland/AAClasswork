require_relative "piece.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "nullpiece"
require_relative "pawn"
require_relative "display"
require "colorize"


class Board
    attr_reader :rows, :sentinel
    def set_up_board
        board = Array.new(8) {Array.new(8, @sentinel)}

        board[0][0] = Rook.new(:black, self, [0,0])
        board[0][7] = Rook.new(:black, self, [0,7])
        board[0][1] = Knight.new(:black, self, [0,1])
        board[0][6] = Knight.new(:black, self, [0,6])
        board[0][2] = Bishop.new(:black, self, [0,2])
        board[0][5] = Bishop.new(:black, self, [0,5])
        board[0][3] = Queen.new(:black, self, [0,3])
        board[0][4] = King.new(:black, self, [0,4])

        (0..7).each { |i| board[1][i] = Pawn.new(:black, self, [1,i])}

        board[7][0] = Rook.new(:white, self, [7,0])
        board[7][7] = Rook.new(:white, self, [7,7])
        board[7][1] = Knight.new(:white, self, [7,1])
        board[7][6] = Knight.new(:white, self, [7,6])
        board[7][2] = Bishop.new(:white, self, [7,2])
        board[7][5] = Bishop.new(:white, self, [7,5])
        board[7][4] = King.new(:white, self, [7,4])
        board[7][3] = Queen.new(:white, self, [7,3])

        (0..7).each { |i| board[6][i] = Pawn.new(:white, self, [6,i])}

        board
    end

    def initialize(rows = nil)
        @sentinel = NullPiece.instance
        @rows = rows || set_up_board
    end

    def move_piece(color, start_pos, end_pos)
        x, y = start_pos
        raise "no piece there" if rows[x][y].empty?
        piece = rows[x][y]
        raise "not a valid ending position" if !piece.valid_moves.include?(end_pos)
        end_x, end_y = end_pos
        rows[end_x][end_y] = piece
        piece.pos = end_pos
        rows[x][y] = sentinel
    end

    def move_piece!(color, start_pos, end_pos)
        x, y = start_pos
        raise "no piece there" if rows[x][y].empty?
        piece = rows[x][y]
        raise "not a valid ending position" if !piece.moves.include?(end_pos)
        end_x, end_y = end_pos
        rows[end_x][end_y] = piece
        piece.pos = end_pos
        rows[x][y] = sentinel
    end

    def in_check?(color)
        king_pos = find_king(color)
        opp_color = (color == :white ? :black : :white)
        @rows.flatten.any? {|piece| piece.color == opp_color && piece.moves.include?(king_pos)}
    end

    def checkmate?(color)
        in_check?(color) && @rows.flatten.none? {|piece| piece.color == color && !piece.valid_moves.empty?}
    end

    def find_king(color)
        i = 0
        @rows.flatten.each_with_index {|piece, j| i = j if (piece.symbol == ' ♚ '.colorize(color))}
        [i / 8, i % 8]
    end

    def valid_pos?(pos)
        pos.all? {|coord| coord.between?(0,7)}
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        @rows[x][y] = val
    end

    def dup
        dup_board = Board.new(@rows.dup)
        dup_board.rows.each_with_index do |row, x|
            new_row = []
            row.each_with_index do |piece, y|
                if piece.empty?
                    new_row << piece
                else
                    new_piece = piece.dup
                    new_piece.board = dup_board
                    new_piece.pos = [x, y]
                    new_row << new_piece
                end
            end
            dup_board.reassign_row(x, new_row)
        end            
        dup_board
    end

    protected
    def reassign_row(i, new_row)
        @rows[i] = new_row
    end
end

