require_relative "card" 

class Deck
    attr_reader :deck, :drawn_cards 

    def initialize
        @deck = Card.build_deck.shuffle 
        #creates a deck variable that calls Card.build_deck
        #sets an empty array for drawn cards
    end

    def draw
        @deck.pop 
        #removes the top card from the deck, adds it to the drawn cards, and returns
        #the card that was drawn
    end

    def reset_deck
        @deck = Card.build_deck.shuffle
        #sets deck to a newly built deck
        #shuffles deck
    end 
end