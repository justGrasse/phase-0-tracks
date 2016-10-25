puts "Thank you for your interest in Werewolf Inc."
puts "Please complete the following survey:"

puts "What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.to_i

puts "What year were you born?"
birth_year = gets.to_i
this_year = 2016
calc_age = this_year - birth_year

wants_garlic = ""
until (wants_garlic == "y") || (wants_garlic == "n")
	puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
	wants_garlic = gets.chomp
end

wants_ins = ""
until (wants_ins == "y") || (wants_ins == "n")
	puts "Would you like to enroll in the company's health insurance? (y/n)"
	wants_ins = gets.chomp
end


decision = "Results inconclusive."

# If the employee got their age right, and is willing to eat garlic bread or sign up for insurance, the result is “Probably not a vampire.”

if (age == calc_age || age == calc_age - 1) && (wants_garlic == "y" || wants_ins == "y")
	decision = "Probably not a vampire."
end

# If the employee got their age wrong, and hates garlic bread or waives insurance, the result is “Probably a vampire.”

if !(age == calc_age || age == calc_age - 1) && !(wants_garlic == "y" && wants_ins == "y")
	decision = "Probably a vampire."
end

# If the employee got their age wrong, hates garlic bread, and doesn’t want insurance, the result is “Almost certainly a vampire.”

if !(age == calc_age || age == calc_age - 1) && !(wants_garlic == "y" || wants_ins == "y")
	decision = "Almost certainly a vampire."
end

# Even if the employee is an amazing liar otherwise, anyone going by the name of “Drake Cula” or “Tu Fang” is clearly a vampire, because come on. In that case, you should print “Definitely a vampire.”

if (name == "Drake Cula" || name == "Tu Fang") 
	decision = "Definitely a vampire."
end

# Otherwise, print “Results inconclusive.”

puts decision
