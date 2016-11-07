# *~*~*~*~*~*~* CLASS *~*~*~*~*~*~*
# Puppy

# *~*~*~*~*~ ATTRIBUTES *~*~*~*~*~*
# Name: apollo
# Breed: alaskan husky
# Sex: male
# Color: white, gray
# Weight: 60lbs
# Collar: Blue 
# Age: 8
# Fetch-Friendly: yes

# *~*~*~*~*~*~ METHODS ~*~*~*~*~*~*
# .eat
# .give_paw
# .fetch
# .walk
# .run
# .speak
# .save_timmy_from_the_well

class Puppy
end

Puppy.methods

puts duchess = Puppy.new
puts fido = Puppy.new
puts spot = Puppy.new
puts "*~"*10
puts spot.class
puts duchess == fido
puts fido.instance_of?(Array)
puts fido.instance_of?(Puppy)
puts # spot.play_dead
puts "*~"*10
puts str = String.new
puts str.length
puts str.empty?
puts str += "huh."
puts str = "some string"
puts greeting = String.new("hello")
puts greeting.length
puts greeting.upcase
