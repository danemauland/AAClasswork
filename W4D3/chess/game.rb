require_relative "board"
require_relative "human_player"
class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player1 = HumanPlayer.new(:white)
        @player2 = HumanPlayer.new(:black)
        @player1.add_display(@display)
        @player2.add_display(@display)
        @current_player = @player1

    end

    def switch_players
        if @current_player == @player1
            @current_player = @player2 
        elsif @current_player == @player2 
            @current_player = @player1
        end
    end

    def play
        until @board.checkmate?(:white) || @board.checkmate?(:black)
            @current_player.make_move(@board)
            switch_players
        end
    end


end