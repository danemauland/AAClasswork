def remove_dups(arr)
    new_arr = []
    arr.each {|ele| new_arr << ele unless new_arr.include?(ele) }
    new_arr
end

def two_sum(arr)
    new_arr = []
    arr.each_with_index do |ele, i|
        if arr[i+1..-1].include?(-ele)
            new_arr << [i,arr.index(-ele)] 
        end
    end 
    new_arr
end 

def my_transpose(matrix)
    new_matrix = []
    (0...matrix.length).each do |row|
        new_row = []
        (0...matrix[row].length).each do |col|
            new_row << matrix[col][row]
        end
        new_matrix << new_row
    end
    new_matrix
end

def stock_picker(prices)
    days = [0,0]
    prices.each_with_index do |buy, i|
        prices[i+1..-1].each_with_index do |sell, j|
            old_sell = prices[days[1]] 
            old_buy = prices[days[0]] 
            current_profit = old_sell - old_buy 
            new_profit = (sell - buy)
            if current_profit < new_profit 
                days = [i,j + i + 1]
            end 
        end 
    end 
    days 
end
