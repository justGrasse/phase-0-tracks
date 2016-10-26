
def to_boo(str)
	return true if str == "true"
	return false if str == "false"
	return nil
end

puts "Tell us about that hamster!!!"
puts "Name?"
name = gets.chomp
puts "Volume? (1-10)"
volume = gets.to_i
# puts "The volume is #{volume}"
puts "Fur color?"
fur_color = gets.chomp
puts "This is a good candidate for adoption. AKA It is docile? (true/false)"
is_docile = to_boo(gets.chomp)
# puts "The user chose #{is_docile}"
puts "Estimated age?"
age = nil
age = gets.to_i

if volume > 7
	noisy_level = "REALLY NOISY"
elsif volume > 4
	noisy_level = "the perfect amount of noisy"
else
	noisy_level = "pretty shy"
end

if is_docile
	maybe = "SO TOTALLY"
else
	maybe = "not quite"
end

puts "Coolio! Your #{age}-year-old, #{fur_color} hamster, #{name} sounds rad, yo!
It sounds like it is #{noisy_level}. It looks like it is #{maybe} ready for adoption."