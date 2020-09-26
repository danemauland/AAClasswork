require "byebug"
# def my_min(array)
#     array.each_with_index do |ele,ind| 
#         return ele if  array.drop(ind+1).all? { |ele2| ele2 > ele }
#     end 

# end

def my_min(array)
    min = array.first 
    array.each { |ele| min = ele if ele < min }
    return min

end

# list = [ 0, 3, 5, 4, -5, 10, 1 ]
# puts my_min(list)  # =>  -5

def largest_subsum(list)
    subs = [] 
    list.each_with_index do |ele, ind| 
        list.drop(ind).each_with_index do |ele2, ind2| 
            subs << list[ind..ind+ind2]
        end 
    end 
    subs.map!(&:sum).max

end

def better_largest_subsum(list)
    return list.max if list.max < 0
    largest_sum = list.first 
    current_sum = list.first 
    i = 1
    while i < list.length
        current_sum += list[i]
        if current_sum > largest_sum
            largest_sum = current_sum 
        end 
        i += 1
        if i < list.length - 1 && (current_sum + list[i]) < 0
            current_sum = 0 
            i += 1 
        end 
    end
    largest_sum

end 

list = [5, 3, -7]
p better_largest_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p better_largest_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p better_largest_subsum(list) # => -1 (from [-1])