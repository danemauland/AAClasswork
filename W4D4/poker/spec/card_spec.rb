require "rspec"
require "card"

describe Card do 
    subject(:card) {Card.new(14,:club)} 

    describe "#initialize" do 
        it "takes in an integer and symbol" do 
            expect {Card.new(4, :club)}.to_not raise_error 
        end 

        it "it should raise an error if the integer is not between 2-14" do 
            expect {Card.new(0, :club)}.to raise_error("card value not allowed")
        end 

        it "shold raise an error if the suit is not valid" do 
            expect {Card.new(4, :a)}.to raise_error("card suit not valid") 
        end 
        
        it "it shloud assign the card val to ivar" do 
            expect(card.val).to eq(14) 
        end 

        it "it should assign card suit to an ivar" do
            expect(card.suit).to eq(:club) 
        end 
    end 

    describe "#face_value" do 
        context "if the card is a number card" do
            it "should return the card's value as a string" do
                card = Card.new(4, :club)
                expect(card.face_value).to eq("4")
            end
        end
        context "if the card is not a number card" do
            it "should return the string representing the card's face value" do 
                expect(card.face_value).to eq("A") 
            end 
        end
    end 

    describe "::build_deck" do 
        it "should return an array containing 52 unique cards" do
            deck = Card.build_deck
            deck.map! {|card| card.to_s }
            deck.uniq! 

            expect(deck.length).to eq(52) 
        end 
    end 


end 