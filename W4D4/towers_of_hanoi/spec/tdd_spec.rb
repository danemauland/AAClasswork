require 'rspec'
require 'tdd'

describe "#remove_dups" do
    it "should accept an array as an argument" do
        expect {remove_dups([])}.to_not raise_error()
    end
    it "should raise an argument error if an array is not passed in" do
        expect {remove_dups()}.to raise_error(ArgumentError)
    end

    it "it should remove duplicate elements" do 
        expect(remove_dups([1,1,2,2,3,3])).to eq([1,2,3]) 
    end 

    it "it should return teh elements in the order they first appeared" do 
        expect(remove_dups([1,2,3,3,2,1])).to eq([1,2,3]) 
    end 
end

describe "#two_sum"  do 
    it " it should accept an array as an argument" do
        expect {two_sum([])}.to_not raise_error()
    end
    it "should raise an argument error if an array is not passed in" do
        expect {two_sum()}.to raise_error(ArgumentError)
    end

    it "it should return a twoD array ccontaining the indices sum to zero" do 
        expect(two_sum([1,2,3,-1,-2,-3]).sort).to eq([[0,3],[1,4],[2,5]])
    end 

    it "it should return the twoD array in order" do  
        expect(two_sum([1,2,3,-1,-2,-3])).to eq([[0,3],[1,4],[2,5]])
    end 
end 

describe "#my_transpose" do
    it "should accept a 2d array as an argument" do
        expect {my_transpose([[]])}.to_not raise_error
    end
    it "should raise an argument error if an array is not passed in" do
        expect {my_transpose()}.to raise_error(ArgumentError)
    end
    it "should return a new array with rows as columns and columns as rows" do
        expect(my_transpose([[1,2,3],[4,5,6],["a","b","c"]])).to eq([[1,4,"a"],[2,5,"b"],[3,6,"c"]])
    end
end

describe "#stock_picker" do
    it "should accept an array as an argument" do
        expect {stock_picker([])}.to_not raise_error()
    end
    it "should raise an argument error if an array is not passed in" do
        expect {stock_picker()}.to raise_error(ArgumentError)
    end
    it "should return the most profitable pair of days" do
        expect(stock_picker([15,50,20,30])).to eq([0,1]) 
        expect(stock_picker([25,50,20,30])).to eq([0,1])
        expect(stock_picker([35,50,20,45])).to eq([2,3])
    end

end