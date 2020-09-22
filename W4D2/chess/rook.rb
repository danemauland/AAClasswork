require_relative "slideable.rb"
class Rook < Piece
    include Slideable
 
    def symbol
        :R
    end

    protected
    def move_dirs
        horizontal = true
        diagonal = false
        [horizontal, diagonal]
    end
end