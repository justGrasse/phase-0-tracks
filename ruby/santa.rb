# DOMAIN LOGIC

# Define Class 'Santa'
class Santa 
	def speak
		puts "Ho, ho, ho! Haaaappy Holidays!"
	end
	
	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end
	
	def initialize
		puts "Initializing Santa instance..."
	end
end

# DRIVER CODE

# TEST CODE

santa_1 = Santa.new
santa_1.speak
santa_1.eat_milk_and_cookies('Choco-Chippy')
