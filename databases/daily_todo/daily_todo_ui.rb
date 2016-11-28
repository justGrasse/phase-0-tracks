# Daily To-Do List UI:

=begin

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
puts "ui!!!!"