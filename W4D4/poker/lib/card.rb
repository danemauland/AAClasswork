class Card

    def self.build_deck
        deck = []
        [:heart, :club, :diamond,:spade].each do |suit|
            (2..14).each do |num|
                deck << self.new(num, suit) 
            end 
        end 
        deck 
        #constructs an array containing the 52 different cards in a deck
    end

    # def self.random
    #     suit = [:heart, :club, :diamond,:spade].sample
    #     value = (2..14).to_a.sample
    #     self.new(value, suit)
    # end

    attr_reader :val, :suit 

    def initialize(val, suit) 
        raise "card value not allowed" unless val.between?(2,14)
        raise "card suit not valid"  unless [:heart, :club, :diamond,:spade].include?(suit) 

        @val = val 
        @suit = suit 
        #takes in an integer representing a card value and takes in a symbol 
        #representing the suit
        #sets @value to the card value
        #sets @suit to the card suit
    end

    def face_value
        return self.val.to_s if self.val < 11
        case self.val
        when 11
            "J"
        when 12
            "Q"
        when 13
            "K"
        when 14
            "A"
        end
        #converts the integer value to a string representing the card's value
    end

    def suit_symbol
        case self.suit
        when :spade
            "♠"
        when :heart
            "♥"
        when :club
            "♣"
        when :diamond
            "♦"
        end
    end

    def to_s
        face_value + suit_symbol
    end

    def inspect
        self.to_s
    end

end