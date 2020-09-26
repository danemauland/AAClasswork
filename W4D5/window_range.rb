class MyQueue
    def initialize
        @queue = []
    end

    def empty?
        @queue.length == 0
    end

    def dequeue
        # ele = @queue[0]
        # @queue = @queue[1..-1]
        # ele
        @queue.shift
    end

    def enqueue(ele)
        @queue << ele
        nil
    end

    def peek
        @queue[0]
    end
end

class MyStack
    def initialize
        @stack = []
    end

    def push(ele)
        @stack.push(ele)
    end

    def pop
        @stack.pop
    end

    def empty? 
        @stack.length == 0 
    end 

    def peek 
        @stack[-1]
    end 

    def size 
        @stack.length 
    end 
end

class StackQueue 
    def initialize
        @stack = MyStack.new
        @stack2 = MyStack.new 
        @stack3 = MyStack.new
    end 

    def enqueue(ele) 
        @stack.push(ele)
    end

    def dequeue                                         
        if @stack2.empty?                                                                        
            until @stack.empty?  
                @stack2.push(@stack.pop) 
            end 
        end
        ele 
    end 

end

class MinMaxStack                   
    def initialize
        @stack = []
        @maxes = MyStack.new
        @mins = MyStack.new
    end

    def push(ele)
        @maxes.push(ele) if @maxes.peek.nil? || ele >= @maxes.peek
        @mins.push(ele) if @mins.peek.nil? || ele <= @mins.peek
        @stack.push(ele)
    end

    def pop
        @maxes.pop if self.peek == @maxes.peek
        @mins.pop if self.peek == @mins.peek
        @stack.pop
    end

    def empty? 
        @stack.length == 0 
    end 

    def peek 
        @stack[-1]
    end 

    def size 
        @stack.length 
    end 

    def max
        @maxes.peek
    end

    def min
        @mins.peek
    end

end

class MinMaxStackQueue 
    def initialize
        @stack = MinMaxStack.new
        @stack2 = MinMaxStack.new 
    end 

    def enqueue(ele) 
        @stack.push(ele)
    end

    def dequeue                                         
        if @stack2.empty?                                                                        
            until @stack.empty?  
                @stack2.push(@stack.pop) 
            end 
        end
        @stack2.pop 
    end 

    def max
        return @stack.max if @stack2.max.nil?
        return @stack2.max if @stack.max.nil?
        [@stack.max, @stack2.max].max
    end

    def min
        return @stack.min if @stack2.min.nil?
        return @stack2.min if @stack.min.nil?
        [@stack.min, @stack2.min].min
    end

    def peek
        if @stack2.empty?
            until @stack.empty?  
                @stack2.push(@stack.pop) 
            end 
        end
        @stack2.peek 
    end
end

def max_windowed_range(arr, win)
    i = 0
    queue = MinMaxStackQueue.new
    while i < win
        queue.enqueue(arr[i])
        i += 1
    end
    current_max_range = queue.max - queue.min
    i = 0
    while i < arr.length - win
        queue.enqueue(arr[i + win])
        queue.dequeue
        range = queue.max - queue.min
        current_max_range = range if range > current_max_range
        i += 1
    end
    current_max_range
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def naive(arr, win)
    current_max_range = 0
    i = 0
    while i < arr.length - win + 1
        window = arr[i...i+win]
        range = window.max - window.min
        current_max_range = range if range > current_max_range
        i += 1
    end
    current_max_range
end

# p naive([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p naive([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p naive([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p naive([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8