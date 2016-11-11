# DOMAIN LOGIC

class Game

	attr_reader :password
	attr_reader :guess_max
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
		# GUESSES: 7 for 3-5 letters, 8 for 6-8, 9 for 9-11, 10 for 12-14
		@guess_max = 6 + @password.length/3 
	end

	def check_guess(letter)
		# puts "check_guess(#{letter}) called"
		# Get a list of correct indices
		correct_indices = @password.each_index.select {|i| 
			@password[i]==letter.upcase || @password[i]==letter.downcase
		}
		# puts "correct_letters is #{correct_indices}"

		# if (repeated letter)
		if !is_valid(letter)

		# if (repeated letter)
		elsif @used_letters.index(letter)
			repeat_letter(letter)
		
		# if (no correct letters)		
		elsif correct_indices == []
			wrong_guess(letter)
			@used_letters.push(letter)
		
		# if (correct letters)
		else
			add_letter(correct_indices)
			@used_letters.push(letter)
		end
		
		@board	
	end

	def is_valid(guess)
		alpha = "abcdefghijklmnopqrstuvwxyz"
		if guess.length != 1
			puts "*** You must select ONE letter ***"
			false
		elsif alpha.index(guess.downcase)
			true	
		else
			puts "*** You must select a LETTER ***"
			false
		end
	end

	def repeat_letter(letter)
		# puts "repeat_letter(#{letter}) begins"		
		puts "\nYou already guessed '#{letter}'"
	end

	def wrong_guess(letter)
		# puts "wrong_guess(#{letter}) begins"
		@guess_count += 1
		puts "\nWRONG!!! There is no '#{letter}'."
		if @guess_count == @guess_max
			lose_game
		else
			puts "You have #{@guess_max - @guess_count} guesses left."
		end
	end

	def add_letter(correct_letters)
		puts "add_letter(#{correct_letters}) begins..."
		correct_letters.each { |i| @board[i] = @password[i]}
		if !@board.index("_")
			win_game
		end
	end

	def lose_game
		@is_over = true
		puts "Sorry, but you're out of guesses! The word was:"
		puts "#{@password.join(' ')}"
	end

	def win_game
		@is_over = true
		puts "\nCongratulations! You guessed the word:"
		puts "#{@password.join(' ')}"
	end

	def valid_password
		@password.each_index{ |i|
			return false if !"abcdefghijklmnopqrstuvwxyz".index(@password[i].downcase)
		}
		if @password.length < 3 
			puts "Password is TOO short, must be at least 3 letters MIN."
			return false
		elsif @password.length >14
			puts "Password is TOO long, must be no more than 14 letters MAX."
			return false
		end
		true
	end

end


# DRIVER LOGIC

puts "Welcome to 'GUESS THE WORD'!"
# Get the WORD from user #1
puts "Player 1: What is the password?"
game = Game.new(gets.chomp)

until game.valid_password
	puts "Please use letters only:"
	game = Game.new(gets.chomp)
end


# Check if the game is over, otherwise
while !game.is_over
	puts '*~'*20+'*'
	puts "Here's the board:"
	puts game.board.join (' ')
	# Get guess from Player2
	puts "Player 2: Guess a letter:"
	letter_guess = gets
	letter_guess ||= ''
	letter_guess.chomp!

	# Check the guess + Display the BOARD
	puts '*~'*20+'*'
	game.check_guess(letter_guess)
	
end
