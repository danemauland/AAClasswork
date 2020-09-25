class Hanoi
    attr_reader :begin, :other, :end
    def initialize(n)
        @begin = (1..n).to_a.reverse
        @other = []
        @end = [] 
        #takes in a number representing the number of disks
        #creates 3 arrays, (beginner, other, end)
        #beginner array should have n disks, with the top disk being the smallest
        #and the bottom disk being the largest
    end

    def move(from, to) 
        to << from.pop 
        #takes in a beginning and ending array
        #moves the top disk in the beginning array to the top of the ending array
    end

    def won?
        @begin.empty? && @other.empty? 
        #checks to see if all the disks are on the final array, returns true if so
        #and false if otherwise
    end

    def move_is_valid?(from, to)
        return false if from.empty?
        return true if to.empty?

        from[-1] < to[-1] 
       #takes in a beginning array and ending array
       #returns false if the beginning array is empty
       #returns true if the top disk of 'from' is smaller
       #than the top disk in ending array (or the ending array is empty)
       #returns false otherwise 
    end

    def play
        #loops until the game is over. Prompts the user to select the beginning
        #and ending arrays, checks if the move is valid, then moves the disks. If
        #the move is not valid, prompt the user until they enter a valid move
        until won?
            render
            prompt("from")
            begin
                from = get_input
            rescue
                puts "invalid entry, try again"
                retry
            end
            prompt("to")
            begin
                to = get_input
            rescue
                puts "invalid entry, try again"
                retry
            end
            if move_is_valid?(from, to)
                move(from, to)
            else
                puts "Invalid move, please try again"
            end
        end
        "congrats, you won!"
    end

    def prompt(str)
        puts "enter the pillar you would like to move #{str} (1, 2, or 3)"
    end

    def get_input
        case gets.chomp.to_i
        when 1
            @begin
        when 2
            @other
        when 3
            @end
        else
            raise "invalid position"
        end
    end

    def render
        puts "1: " + @begin.join(" ")
        puts "2: " + @other.join(" ")
        puts "3: " + @end.join(" ")
    end


end