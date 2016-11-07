# DOMAIN LOGIC

# Define Class 'Santa'
class Santa 
	
	def initialize(gender,ethnicity)
		# puts "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaaappy Holidays!"
	end
	
	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end

end

# DRIVER CODE

santas = []
example_genders = ['agender', 'female', 'bigender', 'male', 'female', 'gender fluid', 'N/A']
example_ethnicities = ['black', 'Latino', 'white', 'Japanese-African', 'prefer not to say', 'Mystical Creature (unicorn)', 'N/A']
example_genders.length.times do |i|
  # puts
  # puts "Creating a #{example_genders[i]} #{example_ethnicities[i]} Santa!"
  santas.push(Santa.new(example_genders[i], example_ethnicities[i]))
  # puts "There are now #{santas.length} Santas!"
  # puts
end

cookies = ['Peanut Butter Cookie', 'Ginger Snap', 'Choco-Chippy', 'Thin Mint']

santas.each do |santa|
	santa.speak
	santa.eat_milk_and_cookies(cookies.sample)
	puts '*~'*20+'*'
end

# TEST CODE

# santa_1 = Santa.new
# santa_1.speak
# santa_1.eat_milk_and_cookies('Choco-Chippy')
