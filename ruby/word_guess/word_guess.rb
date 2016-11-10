# DOMAIN LOGIC

class Game

	attr_reader :password
	attr_reader :guess_count
	attr_reader :is_over
	attr_reader :board
	attr_reader :used_letters # ALL CAPS

	def initialize(password)
		@password = password.split('')
		@guess_count = 0
		@is_over = false
		@board = ['_']*password.length
		@used_letters = []
	end

	def check_guess(letter)
		puts "check_guess(#{letter}) called"
		# Get a list of correct indices
		correct_indices = @password.each_index.select {|i| 
			@password[i]==letter.upcase || @password[i]==letter.downcase
		}
		puts "correct_letters is #{correct_indices}"

		# if (repeated letter)
		if @used_letters.index(letter)
			repeat_letter(letter)
		# if (no correct letters)		
		elsif correct_indices == []
			wrong_guess(letter)
		# if (correct letters)
		else
			add_letter(correct_indices)
		end
		@board	
	end

	def repeat_letter(letter)
		puts "repeat_letter(#{letter}) begins"		
	end

	def wrong_guess(letter)
		puts "wrong_guess(#{letter}) begins"
		@guess_count += 1
		puts "WRONG!!! There is no '#{letter}'."
		if @guess_count == 7
			lose_game
		else
			puts "You have #{7 - @guess_count} guesses left."
		end
	end



	def add_letter(correct_letters)
		puts "add_letter(#{correct_letters}) begins..."
		correct_letters.each { |i| @board[i] = @password[i]}
	end



	def lose_game
		@is_over = true
		puts "Sorry, but you're out of guesses! The word was:"
		puts "#{@password.join('')}"
	end

end



# DRIVER LOGIC

puts "Welcome to GUESS THE WORD!"
# Get the WORD from user #1
puts '*~'*20+'*'
puts "Player 1: What is the password?"
game = Game.new(gets.chomp)

# Check if the game is over, otherwise
while !game.is_over
	puts '*~'*20+'*'
	puts "Player 2: Guess a letter:"
	letter_guess = gets.chomp

	# Display the BOARD
	game.check_guess(letter_guess)

	# Get GUESS from user #2

end

# Display CONGRATS or FAILURE message