require 'rspec'
require "hand"
require "byebug"
describe Hand do
    subject(:test_hand) {Hand.new}
    let(:card) { double("card")}
    let(:ace) {double("ace", :val => 14)}
    let(:king) {double("king", :val => 13)}
    let(:queen) {double("queen", :val => 12)}
    let(:jack) {double("jack", :val => 11)}
    let(:ten) {double("ten", :val => 10)}
    let(:nine) {double("nine", :val => 9)}
    let(:five) {double("five", :val => 5)}
    let(:four) {double("four", :val => 4)}
    let(:three) {double("three", :val => 3)}
    let(:two) {double("two", :val => 2)}
    let(:club) {double("club", :suit => :club, :val => nil)}
    let(:ace_club) {double("club", :suit => :club, :val => 14)}
    let(:king_club) {double("club", :suit => :club, :val => 13)}
    let(:queen_club) {double("club", :suit => :club, :val => 12)}
    let(:jack_club) {double("club", :suit => :club, :val => 11)}
    let(:ten_club) {double("club", :suit => :club, :val => 10)}
    let(:nine_club) {double("club", :suit => :club, :val => 9)}
    let(:spade) {double("club", :suit => :spade, :val => nil)}

    describe "#initialize" do
        it "creates an empty array to hold the card instances" do
            expect(Hand.new.hand).to eq([])
        end
        it "creates a score array containing 8 0's followed by an empty array" do
            expect(Hand.new.score).to eq([0,0,0,0,0,0,0,0,[]])
        end
    end
    describe "#add_card" do
        it "adds the given card to the hand" do
            test_hand.add_card(card)
            expect(test_hand.hand).to be_include(card)
        end
    end
    describe "#discard" do
        it "removes the given card from the hand" do
            test_hand.add_card(card)
            test_hand.discard(card)
            expect(test_hand.hand).to_not be_include(card)
        end
    end
    describe "#reset_hand" do
        it "sets the array holding the cards to an empty array" do
            test_hand.add_card(card)
            test_hand.reset_hand
            expect(test_hand.hand).to eq([])
        end
        it "sets the hand's score back to an array containing 8 0's followed by an empty array" do
            test_hand.instance_variable_set("@score", [5,0,0,0,0,0,0,0,0])
            test_hand.reset_hand
            expect(test_hand.score).to eq([0,0,0,0,0,0,0,0,[]])
        end
    end
    describe "#high_card_score" do
        it "returns a sorted array of the hand values with the highest value first" do
            test_hand.instance_variable_set("@hand", [king, queen, jack, ten, nine])
            expect(test_hand.high_card_score).to eq([13,12,11,10,9])
        end
    end
    describe "#one_pair_score" do
        it "returns 0 if no pairs are in the hand" do
            test_hand.instance_variable_set("@hand", [king, queen, jack, ten, nine])
            expect(test_hand.one_pair_score).to eq(0)
        end
        it "returns 0 if the hand contains three of a kind but no pair" do
            test_hand.instance_variable_set("@hand", [king, king, king, ten, nine])
            expect(test_hand.one_pair_score).to eq(0)
        end
        it "returns the value of the pair if the hand contains one pair" do
            test_hand.instance_variable_set("@hand", [king, queen, queen, ten, nine])
            expect(test_hand.one_pair_score).to eq(12)
        end
        it "returns the value of the smallest pair if the hand contains two pairs" do
            test_hand.instance_variable_set("@hand", [king, queen, queen, ten, ten])
            expect(test_hand.one_pair_score).to eq(10)
        end
        it "returns the value of the pair if the hand contains a full house" do
            test_hand.instance_variable_set("@hand", [ten, queen, queen, ten, ten])
            expect(test_hand.one_pair_score).to eq(12)
        end
    end
    describe "#two_pair_score" do
        it "returns 0 if no pairs are in the hand" do
            test_hand.instance_variable_set("@hand", [king, queen, jack, ten, nine])
            expect(test_hand.two_pair_score).to eq(0)
        end
        it "returns 0 if only one pair is in the hand" do
            test_hand.instance_variable_set("@hand", [king, king, jack, ten, nine])
            expect(test_hand.two_pair_score).to eq(0)
        end
        it "returns 0 if there is a full house" do
            test_hand.instance_variable_set("@hand", [king, king, king, ten, ten])
            expect(test_hand.two_pair_score).to eq(0)
        end
        it "returns 0 if there is four of a kind" do
            test_hand.instance_variable_set("@hand", [king, king, king, king, ten])
            expect(test_hand.two_pair_score).to eq(0)
        end
        it "returns the value of the largest pair if the hand contains two pairs" do
            test_hand.instance_variable_set("@hand", [king, queen, queen, ten, ten])
            expect(test_hand.two_pair_score).to eq(12)
        end
    end
    describe "#trips_score" do
        it "returns 0 if no trips are in the hand" do
            test_hand.instance_variable_set("@hand", [king, king, jack, jack, nine])
            expect(test_hand.trips_score).to eq(0)
        end
        it "returns the value of the trips if the hand contains trips" do
            test_hand.instance_variable_set("@hand", [king, queen, queen, queen, ten])
            expect(test_hand.trips_score).to eq(12)
        end
        it "returns the value of the trips if the hand contains a full house" do
            test_hand.instance_variable_set("@hand", [ten, queen, queen, queen, ten])
            expect(test_hand.trips_score).to eq(12)
        end
    end

    describe "#straight_score" do
        it "returns 0 if the hand does not contain a straight" do
            test_hand.instance_variable_set("@hand", [king, king, jack, jack, nine])
            expect(test_hand.straight_score).to eq(0)
        end
        it "returns the value of the highest card if the hand contains a straight" do
            test_hand.instance_variable_set("@hand", [king, queen, jack, ten, nine])
            expect(test_hand.straight_score).to eq(13)
        end
        it "returns 5 in case of A2345" do
            test_hand.instance_variable_set("@hand", [ace, five, four, three, two])
            expect(test_hand.straight_score).to eq(5)
        end
    end

    describe "#flush_score" do
        it "returns 0 if the hand does not contain a flush" do
            test_hand.instance_variable_set("@hand", [club, club, spade, spade, club])
            expect(test_hand.flush_score).to eq(0)
        end
        it "returns the value of the highest card if the hand contains a flush" do
            test_hand.instance_variable_set("@hand", [ace_club, king_club, queen_club, jack_club, nine_club])
            expect(test_hand.flush_score).to eq(14)
        end
    end

    describe "#full_house_score" do
        it "returns 0 if the hand does not contain a full house" do
            test_hand.instance_variable_set("@hand", [king, queen, queen, queen, ten])
            expect(test_hand.full_house_score).to eq(0)
        end
        it "returns the value of the trips if the hand contains a full house" do
            test_hand.instance_variable_set("@hand", [ten, queen, queen, queen, ten])
            expect(test_hand.full_house_score).to eq(12)
        end
    end

    describe "#quads_score" do
        it "returns 0 if no quads are in the hand" do
            test_hand.instance_variable_set("@hand", [king, king, jack, jack, king])
            expect(test_hand.quads_score).to eq(0)
        end
        it "returns the value of the quads if the hand contains quads" do
            test_hand.instance_variable_set("@hand", [queen, queen, queen, queen, ten])
            expect(test_hand.quads_score).to eq(12)
        end
    end

    describe "#straight_flush_score" do
        it "returns 0 if the hand does not contain a straight flush" do
            test_hand.instance_variable_set("@hand", [ace_club, king_club, queen_club, jack_club, nine_club])
            expect(test_hand.straight_flush_score).to eq(0)
        end
        it "returns the value of the highest card if the hand contains a straight flush" do
            test_hand.instance_variable_set("@hand", [ace_club, king_club, queen_club, jack_club, ten_club])
            expect(test_hand.straight_flush_score).to eq(14)
        end
    end
    describe "#update_score" do
        it "updates the hand's score" do
            test_hand.instance_variable_set("@hand", [ace_club, king_club, queen_club, jack_club, ten_club])
            expect(test_hand.update_score).to eq([14,0,0,14,14,0,0,0,[14,13,12,11,10]])
        end
    end
end