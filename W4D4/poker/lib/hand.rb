# require_relative "card"
class Hand
    attr_reader :hand, :score
    def initialize
        @hand = []
        @score = [0,0,0,0,0,0,0,0,[]]
    end

    def add_card(card)
        @hand << card
    end

    def discard(card)
        @hand.delete(card)
    end

    def reset_hand
        @hand = []
        @score = [0,0,0,0,0,0,0,0,[]]
    end

    def high_card_score
        @hand.map(&:val).sort.reverse
    end

    def one_pair_score
        pairs = []
        @hand.each.with_index do |card, i|
            count = @hand.count {|card2| card.val == card2.val}
            pairs << card if count == 2
        end
        return 0 if pairs.empty?
        pairs.map(&:val).min #returns min because two_pair_score will have a value if
                            # there is more than one pair, and if that's a tie it's
                            #broken by the lower pair score
    end

    def two_pair_score
        pairs = []
        @hand.each.with_index do |card, i|
            count = @hand.count {|card2| card.val == card2.val}
            pairs << card if count == 2
        end
        return 0 if pairs.uniq.length < 2
        pairs.map(&:val).max
    end

    def trips_score
        @hand.each.with_index do |card, i|
            count = @hand.count {|card2| card.val == card2.val}
            return card.val if count == 3
        end
        0
    end

    def straight_score
        card_vals = hand.map(&:val)
        if card_vals.uniq.length == 5
            return card_vals.max if card_vals.max == card_vals.min + 4
            return 5 if card_vals.sort == [2,3,4,5,14]
            return 0
        else
            0
        end
    end

    def flush_score
        card_suits = hand.map(&:suit)
        return hand.map(&:val).max if card_suits.all? {|suit| card_suits[0] == suit}
        0
    end

    def full_house_score
        score_trips = trips_score
        score_pair = one_pair_score
        return 0 if score_trips == 0 || score_pair == 0
        score_trips
    end

    def quads_score
        return hand[0].val if @hand.count {|card| @hand[0].val == card.val } == 4
        return hand[1].val if @hand.count {|card| @hand[1].val == card.val } == 4
        0
    end

    def straight_flush_score
        score_straight = straight_score
        score_flush = flush_score
        return 0 if score_straight == 0 || score_flush == 0
        score_straight
    end

    def update_score
        @score[0] = straight_flush_score
        @score[1] = quads_score
        @score[2] = full_house_score
        @score[3] = flush_score
        @score[4] = straight_score
        @score[5] = trips_score
        @score[6] = two_pair_score
        @score[7] = one_pair_score
        @score[8] = high_card_score
        @score
    end

end