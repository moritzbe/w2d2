# SL5. Conway's Game of Life

#Conway’s Game of Life. 

# http://en.wikipedia.org/wiki/Conway's_Game_of_Life

# We think this is a pretty cool game, so we want in, 
#and decide to implement it. But not implement it cowboy-style: 
#we know TDD! 
#and implement this funny game, step by step, with TDD.

require "pry"

class Evolutionrules
	attr_accessor :gamefield
	def initialize
		#death = 0, live = 1
		@gamefield = Hash.new(0)
			(1..10).each do |i| 
				(1..10).each do |j|
				@gamefield["#{i},#{j}"] = 0
				end
			end
		#here we get the starting colony
		@gamefield["4,4"] = 1
		@gamefield["4,5"] = 1
		@gamefield["4,6"] = 1
		@gamefield["3,4"] = 1
	end

	def cellselect(i,j)
		@gamefield["#{i},#{j}"]
	end

	def check_environment(i,j)
		environment = cellselect(i+1,j) + cellselect(i-1,j) + cellselect(i+1,j+1) + cellselect(i,j+1) + cellselect(i-1,j+1) + cellselect(i-1,j-1) + cellselect(i,j-1) + cellselect(i+1,j-1)
	end




	def dead_or_alive(i,j)
		if @gamefield["#{i},#{j}"] == 1
			if check_environment(i,j) == 4
				@gamefield["#{i},#{j}"] = 0
			elsif check_environment(i,j) <= 1
				@gamefield["#{i},#{j}"] = 0
			elsif check_environment(i,j) == 3
				@gamefield["#{i},#{j}"] = 1
			end

		elsif @gamefield["#{i},#{j}"] == 0
			if check_environment(i,j) == 3
			 @gamefield["#{i},#{j}"] = 1
			end
		end
	end


	def iterateverycell(game, x)
		@game = game
		x.times do |x|
		(1..10).each do |i| 
			(1..10).each do |j|
					@game.dead_or_alive(i,j)
			end
		end
		end
	end


	def outputting
		puts @game.gamefield
	end
end


game = Evolutionrules.new
#5 times...
game.iterateverycell(game, 2)
game.outputting
