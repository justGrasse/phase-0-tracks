# DOMAIN LOGIC

def search_array(arr,num)
	index = 0
	while index < arr.length
		if arr[index] == num
			return index
		end
		index += 1
	end
	nil
end

def fib(num)
	if num < 1
		return []
	elsif num == 1
		return [0]	
	else
		fib_array = [0,1]
	end

	(num - 2).times do
		fib_array.push(fib_array[-1] + fib_array[-2])
	end
	fib_array	
end



# DRIVER CODE


# TEST CODE

# arr = [42,89,23,1]
# p search_array(arr,1) 
# puts "should print '3'"
# p search_array(arr,24) 
# puts "should print 'nil'"

# p fib(0)
# p fib(1)
puts "fib(2):"
p fib(2)
puts "fib(6):"
p fib(6)
puts "test fib(100):"
puts fib(100).last == 218922995834555169026
puts fib(100).last

















# def capAll (str)
# 	str = str.split(' ')
# 	str.map! { |str|
# 		str.capitalize!
# 	}
# 	str.join(' ')
# end

# puts capAll("justin grasse")

