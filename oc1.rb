# it returns the number of letters, within
# all those words, that appear before “t” in the alphabet. For example, 
#given [“I”, “am”, “getting”, “tired”, “of”, “your”, “words”],
# it would return 20.


class Lexiconomitron
	def eatT(text)
		text.gsub!(/[tT]/, '')
	end

	def shazam(array)
			array.map do |string| 
				string.reverse.gsub(/[tT]/, '')
			end
	end 

	def oompa_loompa(array)
			newarray = array.select do |string| string.length <=3
				end
			newarray.map do |item|
				item.gsub(/[tT]/, '')
			end
	end

	def joiner(array)
			array.sort_by! do |item| item.length		
		end
	end

	def counter(array)
			number = 0
			array.each do |string| 
				number += string.downcase.scan(/[abcdefghijklmnopqrs]/).count
			end
			number
	end

end





describe Lexiconomitron do 
	before do
		@process = Lexiconomitron.new
		
	end

	describe "#remove all t´s" do 
		it "should print every text after having eaten up al T´s" do
			expect(@process.eatT("There is my text")).to eq("here is my ex")
		end
	end

	describe "#reverse all strings in an array" do 
		it "should reverse all strings in an array and remove T´s" do
			expect(@process.shazam(["This", "is"])).to eq(["sih", "si"])
		end
	end

	describe "#smallwords" do 
		it "should only print small words" do
			expect(@process.oompa_loompa(["This", "is", "it"])).to eq(["is", "i"])
		end
	end

	describe "#Joiner and sorter" do 
		it "should sort after length" do
			expect(@process.joiner(["This", "is", "its"])).to eq(["is", "its", "This"])
		end
	end

	describe "#Number of letters before t" do 
		it "blablabla" do
			expect(@process.counter(["Hey", "this"])).to eq(5)
		end
	end

end



