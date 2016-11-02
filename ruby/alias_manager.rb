# DOMAIN LOGIC

# getAlias('name'): Converts a name into an Alias (per DBC 5.5)
def getAlias(name)
	# Downcase + Swap the first and last name
	alias_name = name.downcase
	alias_name = alias_name.split(' ')
	alias_name.reverse!

	# Convert string to char array in order to call nextLetters()
	alias_name = alias_name.join(' ')
	alias_name = alias_name.split('')
	alias_name = nextLetters(alias_name)
	
	# Capitalize each name
	alias_name = alias_name.join('')
	alias_name = alias_name.split(' ')
	alias_name.map! { |name| name.capitalize}
	alias_name = alias_name.join(' ')
end

# nextLetters('aliasArray'): Shifts each letter to next vowel/consonant

def nextLetters(aliasArray)
	vowels = 'aeiou'.split('')
	consonants = 'bcdfghjklmnpqrstvwxyz'.split('')

	# use map! to loop through each character of array
	aliasArray.map! {|char|
		
		# if vowel, provide next vowel [METHOD]
		if vowels.include? char
			vowels[(vowels.index(char) + 1) % 5]

		# if consonant, provide next consonant [CONSONANT]
		elsif consonants.include? char
			consonants[(consonants.index(char) + 1) % 21]
		
		else
			' '
		end
	}	
end


# DRIVER CODE

alias_list = {}

# Get name from user

puts 'Hi there agent! What\'s your name?'
agent_name = gets.chomp

while agent_name != 'quit'
	alias_list[agent_name] = getAlias(agent_name)
	puts 'Do you have another name for me? If not, type "quit"'
	agent_name = gets.chomp
end

alias_list.each do |key, value|
	puts "#{key}, your alias will be '#{value}'"
end


# puts getAlias('Justin Grasse')
# puts 'Hsetti Katvop'
# puts getAlias('Felicia Torres')
# puts 'Vussit Gimodoe'