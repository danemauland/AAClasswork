def bad_two_sum?(arr, target)
    arr.each_with_index do |ele, i|
        arr.drop(i + 1).each do |ele2|
            return true if ele + ele2 == target
        end
    end
    false
end



# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def sorted_two_sum?(arr, target)
    sorted = arr.sort
    sorted.each_with_index do |ele, i|
        return true if bsearch(sorted[i+1..-1], target - ele)
    end
    false
end

def bsearch(arr, target)
    return false if arr.empty?
    mid_i = arr.length / 2
    mid_n = arr[mid_i]

    case mid_n <=> target
    when 1
        return bsearch(arr[0...mid_i], target)
    when 0
        return true
    when -1
        return bsearch(arr[1 + mid_i..-1], target)
    end

end

# arr = [0, 1, 5, 7]
# p sorted_two_sum?(arr, 6) # => should be true
# p sorted_two_sum?(arr, 10) # => should be false


def hash_sum?(arr,target)
    hash =  {} 
    arr.each  { |ele| hash[ele] = target-ele }
    hash.any? { |key, value| hash.has_key?(value) && key != value}


end
arr = [0, 1, 5, 7]
p hash_sum?(arr, 6) # => should be true
p hash_sum?(arr, 10) # => should be false