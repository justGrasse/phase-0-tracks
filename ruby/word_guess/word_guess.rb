# DOMAIN LOGIC

class Game

	attr_reader :password
	attr_reader :guess_count
	attr_reader :is_over
	attr_reader :board

	def initialize(password)
		@password = password
		@board = ['_']*password.length
	end


end



# DRIVER LOGIC

puts "Welcome to GUESS THE WORD!"
# Get the WORD from user #1
puts "Player 1: What is the password?"
game = Game.new(gets.chomp)

# Check if the game is over, otherwise
# while condition
		
	# Display the BOARD

	# Get GUESS from user #2

# end

# Display CONGRATS or FAILURE message