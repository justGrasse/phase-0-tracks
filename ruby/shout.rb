# DOMAIN LOGIC

module Shout
	def yell_angrily(words)
		words + "!!!" + " =["
	end
	def yell_happily(words)
		words + "!!!" + " =]"
	end
end

class Orangutan
	include Shout
end

class Klutz
	include Shout
end


# DRIVER CODE

donny = Orangutan.new
puts donny.yell_happily("OooOoOhh OoooOHhh Ah ahhHAHHH")

herbert = Klutz.new
puts herbert.yell_angrily("Oh no, that's a banana pe...")

# OLD MODULE

# module Shout
# 	def self.yell_angrily(words)
# 		words + "!!!" + " =["
# 	end
# 	def self.yell_happily(words)
# 		words + "!!!" + " =]"
# 	end
# end

# message = "Hello World"

# puts Shout.yell_angrily(message)
# puts Shout.yell_happily(message)

