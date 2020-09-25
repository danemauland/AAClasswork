require "rspec"
require "deck"

describe Deck do 
    subject(:test_deck) {Deck.new} 
    describe "#initialize" do 
        it "it creates an ivar holding a deck of cards" do 
            expect(Deck.new.deck.map{|card| card.to_s }.uniq.length).to eq(52)
        end 
        it "should be a shuffled deck" do
            expect(test_deck.deck.map{|card| card.to_s }).to_not eq(Card.build_deck.map{|card| card.to_s})
        end
    end  

    describe "#draw" do 
        it "it should return the last element in deck" do 
            last_card = test_deck.deck[-1] 
            expect(test_deck.draw).to eq(last_card)
        end 
        it "it should remove the card from the deck" do 
            last_card = test_deck.draw
            expect(test_deck.deck).to_not be_include(last_card) 
        end 
    end 

    describe "#reset_deck" do 
        it "should set the @deck to a new array" do
            old_id = test_deck.deck.object_id
            test_deck.reset_deck
            new_id = test_deck.deck.object_id
            expect(old_id).to_not eq(new_id)
        end
        it "should create a shuffled deck" do
            test_deck.reset_deck
            expect(test_deck.deck.map{|card| card.to_s }).to_not eq(Card.build_deck.map{|card| card.to_s})
        end
    end 

    
end 