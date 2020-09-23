require "colorize"
require_relative "cursor"
class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        new_rows = []
        @board.rows.each_with_index do |row, x|
            new_row = []
            row.each_with_index do |piece, y|
                if x == @cursor.cursor_pos[0] && y == @cursor.cursor_pos[1]
                    new_row << piece.symbol.colorize(:background => :red) if !@cursor.selected
                    new_row << piece.symbol.colorize(:background => :green) if @cursor.selected
                else
                    new_row << piece.symbol.colorize(background: :light_blue) if (x + y).even?
                    new_row << piece.symbol if (x + y).odd?
                end
            end
            new_rows << new_row
        end
        puts new_rows.map {|row| row.join("")}.join("\n")
    end

    def get_input
        @cursor.get_input
    end
end