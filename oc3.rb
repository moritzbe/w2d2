# 1. Writing tests that validate the behaviour of all five methods of the 
#Varys class. You should write several tests for the methods
# (except for the ones that return a simple String), exploring different 
#parameter possibilities. Think hard!
# 2. Rewrite and refactor the code so it is way more readable, easier to 
#maintain, and follows the conventions that we have been following
# at Ironhack. During the process of refactoring, use the specs in order 
#to know you didn’t break anything.

class Varys
  #Timecop.freeze(Date.today + 3)
  def say_my_name!
      "I am Varys, and I'm here to say what you want to hear."
  end

  def say_cersei_rocks!
      "Cersei rocks!"
  end
  
  def say_joffrey_rocks!
      "Joffrey rocks!"
  end

  def backwards_wording(arg)
      newarg = []
      newarg = arg.select do |item| item.length <= 4 end
      newarg.map { |item| item.reverse}
  end


# Upon receiving a list of float numbers, return a portion of them. If it is
# Friday, return the ones that are below 0. Otherwise, return the ones above
# or equal 0.
  def friday_numbers(arg)
    return arg.select {|number| number < 0} if Time.now.friday? else arg.select {|number| number >= 0} end
  end


describe Varys do
    before do
    @test = Varys.new  
    end

  describe "#say_my_name" do 
    it "should give the right name" do
      expect(@test.say_my_name!).to eq("I am Varys, and I'm here to say what you want to hear.")
    end
  end

   describe "#say_cersei_rocks" do 
    it "should say cersei rocks" do
      expect(@test.say_cersei_rocks!).to eq("Cersei rocks!")
    end
  end

   describe "#say_joffrey_rocks" do 
    it "should say joffrey rocks" do
      expect(@test.say_joffrey_rocks!).to eq("Joffrey rocks!")
    end
  end

   describe "#reverse_array_and_return_the_words_smaller_than_5_letters" do 
    it "shrinkt to words smaller than 5 letters and reverse" do
      expect(@test.backwards_wording(["hallo", "Moritz", "hey"])).to eq(["yeh"])
    end
  end

   describe "#friday_values" do 
    it "on friday, return values below 0, else return values above or equal to 0" do
      expect(@test.friday_numbers([-1, 0, 3])).to eq([0, 3])
    end
  end

     describe "#friday_values" do 
    it "on friday, return values below 0, else return values above or equal to 0" do
      expect(@test.friday_numbers([-1, 0, 3])).to eq([-1])
    end
  end


end



