# DOMAIN LOGIC

# getAlias('name')
def getAlias(name)
	# Downcase + Swap the first and last name
	aliasName = name.downcase
	aliasName = aliasName.split(' ')
	aliasName.reverse!

	# Convert string to array in order to map!
	aliasName = aliasName.join(' ')
	aliasName = aliasName.split('')
	
	# conce
	# aliasName = nextLetters(aliasName)
	aliasName = aliasName.join('')
	aliasName = aliasName.split(' ')
	aliasName.map! { |name|
		name.capitalize
	}
	aliasName = aliasName.join(' ')
end

# nextLetters('aliasArray')

def nextLetters(aliasArray)
	vowels = "aeiou".split('')
	consonants = "bcdfghjklmnpqrstvwxyz".split('')

	# use map! to loop through each character of array
	aliasArray.map! {|char|
		# if vowel, provide next vowel [METHOD]
		if vowels.include? char
			vowels[(vowels.index(char) + 1) % 5]

		# if consonant, provide next consonant [CONSONANT]
		elsif consonants.include? char
			consonants[(consonants.index(char) + 1) % 19]
		end
	}	

end



	# use map! to loop through each character of array
	#aliasName.map! {|char|

		# if vowel, provide next vowel [METHOD]


		# if consonant, provide next consonant [CONSONANT]

	#}

# nextVowel [METHOD]
def nextVowel(char)
	vowels = "aeiou".split('')



end

# nextConsonant [METHOD]


# DRIVER CODE

# Get name from user

puts getAlias("Justin Grasse")
