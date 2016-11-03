game_of_thrones =["terious lanster", "john snow", "red lady", "serse lanaster", "stanus barathen", "the mountain"]

sigil = {
  lanster: "lion",
  starkes: "dier wolf",
  barathen: "staff",
  grey_joy: "kraken"
}

game_of_thrones.each do |name|
  puts "#{name} is probably going to die!"
end


def capAll (str)
  str = str.split(' ')
  str.map! { |str|
    str.capitalize!
    }
  str.join(' ')
end


game_of_thrones.map! do |name|
  puts capAll(name)

end

sigil.each do |house, sigil|
  puts "#{sigil} sigil belongs to house #{house}"
end

#----------------



letters = ["a","b","c","d","e","f"]

numbers ={
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5
}

p letters
letters.reject!{|letter| letter>"d"}
p letters

p numbers
numbers.reject!{|number_spell,num| number_spell.length == num}
p numbers

p letters
letters.select!{|letter| letter>="b"}
p letters

p numbers
numbers.select!{|number_spell,num| number_spell.length < num}
p numbers



letters = ["a","b","c","d","e","f"]

numbers ={
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5
}



p letters
letters.delete_if{|letter| letter>"d"}
p letters


p numbers
numbers.delete_if{|number_spell,num| number_spell.length == num}
p numbers

puts "\n-----------------\n"

p letters
letters.keep_if{|letter| letter>="b"}
p letters

p numbers
numbers.keep_if{|number_spell,num| number_spell.length < num}
p numbers