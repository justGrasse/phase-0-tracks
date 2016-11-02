# DOMAIN LOGIC

# getAlias('name'): Converts a name into an Alias (per DBC 5.5)
def getAlias(name)
	# Downcase + Swap the first and last name
	aliasName = name.downcase
	aliasName = aliasName.split(' ')
	aliasName.reverse!

	# Convert string to char array in order to call nextLetters()
	aliasName = aliasName.join(' ')
	aliasName = aliasName.split('')
	aliasName = nextLetters(aliasName)
	
	# Capitalize each name
	aliasName = aliasName.join('')
	aliasName = aliasName.split(' ')
	aliasName.map! { |name| name.capitalize}
	aliasName = aliasName.join(' ')
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

# Get name from user

puts getAlias('Justin Grasse')
puts 'Hsetti Katvop'
puts getAlias('Felicia Torres')
puts 'Vussit Gimodoe'