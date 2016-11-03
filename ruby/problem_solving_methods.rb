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

def bubble_sort(array)
	array_size = array.length	

	# Define loop for each iteration from index 0 to n
	until array_size == 1
		
		# Iterate through (0,1) to (n-1,n)
		index = 0
		(array_size - 1).times{
			# puts "checked #{index} and #{index+1}"
			if array[index] > array[index + 1]
				# Placeholder for array[index]
				array_index = array[index]
				array[index] = array[index + 1]
				array[index + 1] = array_index
			end
			index += 1
		}
		# Decrement array_size
		array_size -= 1
		# puts "Array size (ln 49) is #{array_size}"
	end
	array
end

arr = [3,2,1]
big_arr = [3,253,3463,46,6,3346,3333]
repeat_nums = [2,6,568,6,6,235,6,45,44444,6666]
rando_alphie = "jhzvsdkcvwhjev".split('')
alpha_numero = [3,325,"three",34,"shfifty shfive",55]

p bubble_sort(arr)
p bubble_sort(big_arr)
p bubble_sort(repeat_nums)
p bubble_sort(rando_alphie).join('')
p bubble_sort(alpha_numero)



# DRIVER CODE


# TEST CODE

# arr = [42,89,23,1]
# p search_array(arr,1) 
# puts "should print '3'"
# p search_array(arr,24) 
# puts "should print 'nil'"

# p fib(0)
# p fib(1)
# puts "fib(2):"
# p fib(2)
# puts "fib(6):"
# p fib(6)
# puts "test fib(100):"
# puts fib(100).last == 218922995834555169026
# puts fib(100).last

















# def capAll (str)
# 	str = str.split(' ')
# 	str.map! { |str|
# 		str.capitalize!
# 	}
# 	str.join(' ')
# end

# puts capAll("justin grasse")

