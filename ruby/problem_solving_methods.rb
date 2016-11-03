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


# DRIVER CODE


# TEST CODE
arr = [42,89,23,1]
p search_array(arr,1) 
puts "should print '3'"
p search_array(arr,24) 
puts "should print 'nil'"




















# def capAll (str)
# 	str = str.split(' ')
# 	str.map! { |str|
# 		str.capitalize!
# 	}
# 	str.join(' ')
# end

# puts capAll("justin grasse")

