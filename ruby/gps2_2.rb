# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # create an empty hash 
  # set default quantity 
  # split the list 
  # iterate through array, include in hash 
  # print hash
  # print the list to the console [can you use one of your other methods here?] pretty_print method 
# output: hash 

def create_list(list_string)
	grocery_list = {}
	list_string.split(' ').each { |item| grocery_list[item] = 1 }
	pretty_print(grocery_list)
end



# Method to add an item to a list
# input: hash, item name and optional quantity
# steps: IF item is NOT in the list, add food string and quantity number 
# output: updated hash 

def add_an_item(grocery_list, item, qty=1)
	grocery_list[item] = qty if !grocery_list.has_key?(item)
end


# Method to remove an item from the list
# input: original hash with item
# steps: .delete item 
# output: updated hash

def remove_an_item(grocery_list, item)
	grocery_list.delete(item)
end

# p remove_an_item(list, 'beer')
# p remove_an_item(list, 'eggs')
# p list

# Method to update the quantity of an item
# input: item and updated quantity
# steps: IF item is in the hash, .push item to hash 
# output: updated hash 

def update_qty(grocery_list, item, qty)
	grocery_list[item] = qty if grocery_list.has_key?(item)
end


# Method to print a list and make it look pretty
# input: hash 
# steps: iterate with .each, use puts to look nice 
# output: pretty dash

def pretty_print(grocery_list)
	puts '*~'*20+'*'
	puts "Here's your PRETTY grocery list:"
	grocery_list.each { |item, qty| puts "- #{item}: #{qty}" }
end


# DRIVER CODE

list = create_list("carrots apples cereal pizza beer")

add_an_item(list,'bacon',2)
add_an_item(list,'beer',10)
pretty_print(list)

update_qty(list,'pizza',5)
update_qty(list,'blitza',5)

pretty_print(list)