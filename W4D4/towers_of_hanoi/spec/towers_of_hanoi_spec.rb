require "rspec"
require "towers_of_hanoi"

describe Hanoi do
    subject(:hanoi) {Hanoi.new(5)}
    describe "#initialize" do
        it "should take in a number representing the size" do
            expect {Hanoi.new(5)}.to_not raise_error
        end
        it "should create 3 separate arrays, @begin, @other, @end" do
            expect(hanoi.begin.class).to eq(Array)
            expect(hanoi.other.class).to eq(Array)
            expect(hanoi.end.class).to eq(Array)
        end
        it "should populate the begin array" do
            expect(hanoi.begin).to eq([5,4,3,2,1]) 
        end 
    end

    describe "#move" do 
        it "it should take in a 'from' and 'to' array" do 
            expect {hanoi.move([],[])}.to_not raise_error
        end 

        it "it should move the last element from 'from' array to 'to' array " do 
            hanoi.move(hanoi.begin, hanoi.end ) 
            expect(hanoi.begin).to eq([5,4,3,2]) 
            expect(hanoi.end).to eq([1]) 
        end 
    end 

    describe "#won" do 
        it "it should take in no arg" do
                expect {hanoi.won?}.to_not raise_error
        end 

        it "it should return false if all the disks are not on 'end' array" do 
            expect(hanoi.won?).to eq(false) 
        end 
        it "it should return true if all the disks are on the 'end' array" do 
            hanoi = Hanoi.new(1) 
            hanoi.move(hanoi.begin, hanoi.end) 
            expect(hanoi.won?).to eq(true)
        end 
    end 
    describe "move_is_valid?" do
        it "should take in a 'from' and 'to' array" do
            expect {hanoi.move_is_valid?(hanoi.begin, hanoi.end)}.to_not raise_error
        end
        it "should return false if the 'from' array is empty" do
           expect(hanoi.move_is_valid?(hanoi.other, hanoi.end)).to eq(false) 
        end
        it "should return true if 'from' is not empty and 'to' is empty" do
            expect(hanoi.move_is_valid?(hanoi.begin, hanoi.end)).to eq(true)
        end

        it "it should return true if teh last disk in 'from' is smaller than the last disk in 'to'" do 
            hanoi.move(hanoi.begin, hanoi.end) 
            hanoi.move(hanoi.begin, hanoi.other) 
            expect(hanoi.move_is_valid?(hanoi.end, hanoi.other)).to eq(true)  
            
        end 
        it "and returns false if otherwise" do 
            hanoi.move(hanoi.begin, hanoi.end) 
            hanoi.move(hanoi.begin, hanoi.other) 
            expect(hanoi.move_is_valid?(hanoi.other, hanoi.end)).to eq(false)  
        end 
    end

end