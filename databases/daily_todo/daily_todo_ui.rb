# Daily To-Do List UI:

=begin

PSEUDOCODE:

declare db = todo.db
Check In: check_in(db)
If first check-in of day
	Change all 'done' to 'false'
print full todo list print_full
Menu: Choose (Add/Delete an activity, Add/Delete from to-do list, Mark as finished)
	(Add an activity)
	(Add to do list)
	(Mark activity as finished)

=end

require_relative 'daily_todo'

# create SQLite3 database
db = SQLite3::Database.new("todo.db")
db.results_as_hash = true


# CHECK IN and update if need be
db.execute("UPDATE todo SET done='false'") if check_in(db)

done = false
until done
	print_full(db)
	choice = print_menu(db)

	# 1. ADD/DELETE ACTIVITY FROM ACTIVITY LIST
	if choice == '1'
		choice_1 = add_delete
		print_activities(db)
		if choice_1 == "ADD"
			puts "Please enter the activity you would like to add:"
			add_activity(db, gets.chomp)
		elsif choice_1 == "DELETE"
			puts "Please enter the activity you would like to delete:"
			delete_activity(db, gets.chomp)
		end		

	# 2. ADD/DELETE FROM TODO LIST	
	elsif choice == '2'
		choice_2 = add_delete
		if choice_2 == "ADD"
			print_unused(db)
			puts "Please enter the activity you would like to add:"
			add_todo(db, gets.chomp)
		elsif choice_2 == "DELETE"
			print_todo_ids(db)
			puts "Please enter the activity you would like to delete:"
			delete_todo(db, gets.chomp)
		end		

	# 3. MARK ACTIVITY AS COMPLETE
	elsif choice == '3' 
		print_full(db)
		print_unfinished(db)
		puts "Which activity did you finish? (enter NUMBER or NVM)"
		complete_activity(db,gets.chomp)
	
# 4. EXIT
	else
		done = true

	end

end
