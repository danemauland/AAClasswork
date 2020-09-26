require_relative "hand"

class Player

    attr_reader :name, hand, player_pot
    def initialize(name, hand, player_pot)
        @name = name
        @hand = hand
        @player_pot = player_pot
        @current_bet = 0
    end

    def add_card(card)
        @hand.add_card(card)
    end

    def discard(card)
        @hand.discard(card)
    end

    def prompt_action(table_bet)
        if @current_bet == table_bet
            begin
                puts "'fold', 'check', or 'raise'"
                case gets.chomp
                when 'fold'
                    fold_hand
                when 'check'
                    table_bet
                when 'raise'
                    puts "enter raise amount"
                    raise_to(gets.chomp.to_i)
                else 
                    raise "invalid entry, try again"
                end
            rescue => e
                puts e.message
                retry
            end
        else
            begin
                puts "'fold', 'call', or 'raise'"
                case gets.chomp
                when 'fold'
                    fold_hand
                when 'call'
                    call(table_bet)
                when 'raise'
                    puts "enter raise amount"
                    raise(gets.chomp.to_i)
                else 
                    raise "invalid entry, try again"
                end
            end
        end
    end

    def fold_hand
        @hand.reset_hand
        @pot -= @current_bet
        @current_bet == 0
        0
    end

    def raise_to(amount)
        @current_bet = min(amount, @player_pot)
        @current_bet
    end

    def call(amount)
        raise_to(amount)
    end

    def lose?
        @player_pot == 0
    end




end