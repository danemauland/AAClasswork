class Integer
  # Integer#hash already implemented for youa
end

class Array # inputs are only numbers.
    def hash
    #store the nth at array.length primes 
    #for each index, find the (i+1)th prime. Raise that prime to the integer at that number
    #find the product of the array
    #hash that integer

    return 0.hash if self.empty?
    primes = nprimes(self.length)
    count = 1
    self.each_with_index do |ele, i|
      count *= primes[i] ** (ele + 1) 
    end
    count.hash

    end
end

def nprimes(num)
  primes = [2]
  i = 3
  until primes.length == num
    primes << i if is_prime?(i)
    i += 2
  end
  primes
end

def is_prime?(num)
  (3...num).each do |factor|
    return false if num % factor == 0
  end
  true
end

class String
  def hash
    alpha = ("A".."z").to_a
    new_arr = []
    self.each_char do |char|
       new_arr << alpha.index(char)
    end
    new_arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    pairs = []
    self.each do |k, v|
      pairs << [k, v]
    end
    pairs.sort
    hash_pairs = pairs.map do |pair|
      sum = 0
      pair.each_with_index do |ele, i|
        sum += ele.hash * (i + 2)
      end
      sum.hash
    end
    hash_pairs.sum.hash
  end
end