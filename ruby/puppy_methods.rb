class Puppy

 def fetch(toy)
   puts "I brought back the #{toy}!"
   toy
 end
 def speak(num)
     num.times{print "woof "}
     puts
 end
 def roll_over
     print "roll over"
     puts
 end
 def dog_years(year_old)
     dog_years = year_old/7
     print dog_years
     puts
 end
 def eat(food)
     puts "I love eating #{food}!"
     puts
 end
 def initialize
     print "initializing new puppy instance..."
 end
end

scooby = Puppy.new
scooby.fetch("clue")
scooby.speak(3)
scooby.roll_over
scooby.dog_years(14)
scooby.eat("pizza")


class Futurama_Aliens
    def initialize
        puts "initializing alien race....."
    end
    def intro(name)
        puts "Hi! My name is #{name}!"
    end
    def location(planet,distance)
        puts "I am from #{planet}, #{distance} light years away."
    end
end

alien = []
chars = ['Bender', 'Fry', 'Leela', 'Scruffy', 'Dr. Zoidburg', 'Amy', 'Calculon']

#our method

50.times do |i|
    alien[i] = Futurama_Aliens.new
    alien[i].intro(chars.sample)
    alien[i].location('earth', 100)
end

p alien.length

#alternative method

alien.each do |char_name|
    char_name.intro(chars.sample)
    char_name.location('mars', 0.2)
end