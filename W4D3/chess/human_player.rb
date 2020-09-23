class HumanPlayer

    def initialize(color)
        @color = color
        @display = nil
    end

    def add_display(display)
        @display = display
    end

    def make_move(board)
        piece = nil
        until piece
            # system("clear")
            puts "select a piece"
            @display.render
            piece = @display.get_input
        end
        end_pos = nil
        until end_pos
            # system("clear")
            puts "select a place to move"
            @display.render
            end_pos = @display.get_input
        end
        p end_pos
        board.move_piece(@color, piece, end_pos)
    rescue => e
        puts e.message
        retry
    end

end

