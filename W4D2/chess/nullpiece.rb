require "singleton"
class NullPiece
    include Singleton
    def initialize
    end

    def moves
        nil
    end

    def symbol
        nil
    end

    def inspect
        :X.to_s
    end

    def color
        nil
    end

end