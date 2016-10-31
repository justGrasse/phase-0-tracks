# DOMAIN LOGIC


# DRIVER CODE

puts "Please provide the following information for the client."

# initialize hash
client_1 = {}

# grab client data
puts "Name:"
client_1[:name] = gets.chomp

puts "Age:"
client_1[:age] = gets.to_i

puts "Number of Children:"
client_1[:num_children] = gets.to_i

puts "Decor Theme:"
client_1[:dec_theme] = gets.chomp

puts "Favorite Color:"
client_1[:fav_color] = gets.chomp

puts "Allergic to beige (y/n):"
client_1[:has_beige_allergy] = gets.chomp

# print hash
puts client_1

update_key = ""

# loop through client corrections
loop do
	puts "Would you like to correct any data?"
	puts "If so which key? Otherwise type 'none':"
	update_key = gets.chomp

	# break for 'none'
	if update_key == "none"
		break
	end
	
	# get value and assign
	puts "What would you like to set " + update_key + " to?"
	if client_1[update_key.to_sym].is_a? Integer
		client_1[update_key.to_sym] = gets.to_i	
	else
		client_1[update_key.to_sym] = gets.chomp
	end
end

puts "Excellent, here's the hash:"

puts client_1
