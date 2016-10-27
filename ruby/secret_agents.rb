# OUR METHOD DECLARATIONS

# create function encrypt with parameter 'secret-code'
def encrypt(secretCode)
	# Create a counter = 0
	counter = 0
	# Begin loop set the condition iterate secret-code.length times
	while counter < secretCode.length
	# Call .next on each character of secret-code
		if secretCode[counter] == "z"
			secretCode[counter] = "a"
		else
			secretCode[counter] = secretCode[counter].next
		end
		counter += 1
	end
	secretCode
end


# create function decrypt with parameter 'secret-code'
def decrypt(secretCode)
	# Create a counter = 0
	counter = 0
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	# Begin loop set the condition iterate secret-code.length times
	while counter < secretCode.length
		# For each character find its index in the alphabet
		letter_index = alphabet.index(secretCode[counter])
		# Assign the previous character in the alphabet string
		secretCode[counter] = alphabet[letter_index - 1]
		counter += 1
	end
	secretCode
end


# DRIVER CODE

# Would you like to encrypt or decrypt

desire = ""

until desire=="encrypt"||desire=="decrypt"
	puts "Would you like to encrypt or decrypt?"
	desire = gets.chomp
end

# What is your secretCode

puts "What's yo secret code, yo?"
secretCode = gets.chomp

# Print the secret Results
if desire == "encrypt"
	puts "Here is your encrypted code: #{encrypt(secretCode)}"
else
	puts "Here is your decrypted code: #{decrypt(secretCode)}"
end



# puts encrypt('abc')
# puts encrypt('zed')
# puts decrypt('bcd')
# puts decrypt('afe')
# puts decrypt('cpphfst')

# puts decrypt(encrypt('swordfish'))
# puts decrypt(encrypt('boogerfish'))
# puts decrypt(encrypt('zazafish'))