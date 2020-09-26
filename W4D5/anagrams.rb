def first_anagram?(str1, str2)
    permuts = []
    arr = str1.split("")
    # (arr.permutation.to_a).include?(str2.split(""))

    until permuts.length == factorial(str1.length)
        arr2 = arr.shuffle
        permuts << arr2.join("") unless permuts.include?(arr2.join(""))
    end
    permuts.include?(str2)
end

def factorial(n)
    return 1 if n == 0
    n * factorial(n-1)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    return true if str1.length == 0 && str2.length == 0
    arr1 = str1.split("")
    arr2 = str2.split("")
    char = arr1.shift 
    return false unless arr2.include?(char)
    i = arr2.find_index(char)
    arr2.delete_at(i)
    second_anagram?(arr1.join(""), arr2.join(""))

end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
    str1.split("").sort == str2.split("").sort
end
    
def fourth_anagram?(str1, str2)
    hash = Hash.new(0)
    str1.each_char do |char| 
        hash[char] += 1
    end 
    str2.each_char do |char| 
        hash[char] -= 1
    end 
    hash.values.all?(0)

end

    
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true