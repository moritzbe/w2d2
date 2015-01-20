# SL4. Crazy numbers



# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

# The second method takes a set of numbers. Then, it should return an array with four values:
# 1. The mode
# 2. The median
# 3. The mean
# 4. The size of the array
# In the event that the array we pass is empty, it should just return nil.

# The third and final method will take a positive integer (let's call it "n") as a parameter, and return the n-th Fibonacci number. If the
# parameter is zero or less, it should just return nil. More info: http://en.wikipedia.org/wiki/Fibonacci_number

# Your goal is to follow these three steps:
# 1. Quickly write a first implementation of the three methods.
# 2. Write a nice set of tests for each method.
# 3. Once the test pass, refactor your methods so they are perfect (so perfect that even Ruby creator would see them with joy and pride!)

class Numbers
	def getarray(array)
		if array.count{ |x| x >= 0 } > array.count { |x| x <= 0 }
			array.select{|x| x >= 0 }

		elsif array.count{ |x| x >= 0 } < array.count { |x| x <= 0 }
			array.select{|x| x <= 0 }
		
		else return "nil"	
		end
	end

	def getnumberset(numberset)
		if numberset.size == 0
			return nil
		else
		end
		size = numberset.size
		halfsize = size/2
		sorted = []
		sorted = numberset.sort
		totalofthemiddle = sorted[halfsize - 1] + sorted[halfsize]

		freq = Hash.new(0)
		numberset.each do |number|
			freq[number] += 1 
		end
		
		freq.sort_by {|key, number| number}
		mode = freq.to_a[-1][0]
		



		@stats = []
		@stats[0] = mode
				if size.odd?
				@stats[1] = sorted[halfsize - 1]
				else
				@stats[1] = totalofthemiddle / 2
				end
		@stats[2] = numberset.inject{|sum,x| sum + x } / size
		@stats[3] = size

		@stats

	end

	def fibonacci(number)
    return  number  if number <= 1 
    fibonacci( number - 1 ) + fibonacci( number - 2 )
	end 

	def testmethod
		return "hey"
	end
end




describe Numbers do 
	before do
		@numbers = Numbers.new
		@array = [1, -1, 2, -2, 3, 3]
		
	end

	describe "#arraysearch" do 
		it "should give the correct array" do
			expect(@numbers.getarray(@array)).to eq([1, 2, 3, 3])
		end
	end

	describe "#arraysearch" do 
		it "should give the correct array" do
			expect(@numbers.getarray([1, -2, -1, -5])).to eq([-2, -1, -5])
		end
	end

	describe "#arraysearch" do 
		it "should give the correct array" do
			expect(@numbers.getarray([1, 2, -1, -5])).to eq("nil")
		end
	end

	describe "#numberslist statistics" do 
		it "should give the correct statistics" do
			expect(@numbers.getnumberset(@array)).to eq([3, 1, 1, 6])
		end
	end

	describe "#return Fibonacci number" do 
		it "should give the correct Fibonacci_number" do
			expect(@numbers.fibonacci(10)).to eq(55)
		end
	end


	describe "#test" do 
		it "test" do
			expect(@numbers.testmethod).to eq("hey")
		end
	end

end

