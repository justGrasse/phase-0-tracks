module Shout
	def self.yell_angrily(words)
		words + "!!!" + " =["
	end
	def self.yell_happily(words)
		words + "!!!" + " =]"
	end
end

message = "Hello World"

puts Shout.yell_angrily(message)
puts Shout.yell_happily(message)
