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

=begin
	

What did you learn about pseudocode from working on this challenge?
- I learned that pseduocoding is far different to different people, and it needs to be adapted to your style of programming (or your 'groups').  It's very valuable to spend time pseudocoding with the intent of making your code readable in the future.

What are the tradeoffs of using arrays and hashes for this challenge?
- The hash was a must, because each item (the values) had associated data (a key).  Doing that with an array would be a nightmare, and require some crazy coding gymnastics.

What does a method return?
- Without an explicit return (e.g. 'return lassie'), it will return the last expression (line of code).  This is the implicit return.

What kind of things can you pass into methods as arguments?
- Any datatype: arrays, strings, integers, floats, hashes, method calls, even blocks of code! 

How can you pass information between methods?
- Using the return  value of the method 
e.g. >> gimme_the_stuff(get_the_stuff_first(stuff))

What concepts were solidified in this challenge, and what concepts are still confusing?
- The value of pseudocoding, I usually liked to jump write into the code, but being forced to pseudocode made that process very efficient.  Also best practices, keeping code (1) dry, (2) readable, and (3) efficient

=end
