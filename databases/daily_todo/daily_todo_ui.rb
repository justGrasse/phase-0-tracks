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
		print_activities(db)
		choice1 = add_delete
		if choice1 == "ADD"
			puts "Please enter the activity you would like to add:"
			add_activity(db, gets.chomp)
		elsif choice1 == "DELETE"
			puts "Please enter the activity you would like to delete:"
			delete_activity(db, gets.chomp)
		end		
	# 2. ADD/DELETE FROM TODO LIST	
	elsif choice == '2' # Include/Remove from ToDo List
		print_full(db)
		choice2 = add_delete
		if choice1 == "ADD"
			puts "Please enter the activity you would like to add:"
			add_todo(db, gets.chomp)
		elsif choice1 == "DELETE"
			puts "Please enter the activity you would like to delete:"
			delete_todo(db, gets.chomp)
		end		
	# 3. MARK ACTIVITY AS COMPLETE
	elsif choice == '3' # Mark activity as complete
		print_full(db)
		print_unfinished(db)
		puts "Which activity did you finish? (enter NUMBER or NVM)"
		complete_activity(db,gets.chomp)
	else
		done = true
	end
end
