# Justin's Daily To-Do List

# DOMAIN LOGIC (+ ORM w/SQLite3)

# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("todo.db")
db.results_as_hash = true


# create SQL command for activity table
create_activities_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS activities(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255)
	) 
SQL

# create SQL command for todo table
create_todo_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS todo(
		id INTEGER PRIMARY KEY,
		activity_id INT,
		done BOOLEAN,
		FOREIGN KEY (activity_id) REFERENCES activities(id)
	) 
SQL

# create SQL command for time log table
create_log_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS log(
		id INTEGER PRIMARY KEY,
		day INT,
		time INT
	) 
SQL

# create todo list tables
db.execute(create_activities_cmd)
db.execute(create_todo_cmd)
db.execute(create_log_cmd)

# create  check-in that logs your time
def check_in(db)
	currentArr = Time.new.to_s.split(' ')
	dayArr = currentArr[0].split('-').join('').to_i
	timeArr = currentArr[1].split(':').join('').to_i
	db.execute("INSERT INTO log (day, time) 
		VALUES (?, ?)", [dayArr, timeArr])
	log = db.execute("SELECT * FROM log")
	# Return true if its the first check-in of the day
	log.length==1 || !log[-1]['day'] == log[-2]['day']
end

# create method to add activities
def add_activity(db, name)
	db.execute("INSERT INTO activities (name) VALUES (?)", [name])
end

# create method to delete activities
def delete_activity(db, name)
	db.execute("DELETE FROM activities WHERE name=?", [name])
end

# create method to add activities to the todo list
def add_todo(db, act_id)
	db.execute("INSERT INTO todo (activity_id, done) VALUES (?,'false')", [act_id])

end

# create method to delete activities from the todo list
def delete_todo(db, act_id)
	db.execute("DELETE FROM todo WHERE activity_id=?", [act_id])
end

# create method to complete activity
def complete_activity(db, act)
	db.execute("UPDATE todo SET done='true' WHERE activity = ?", [act])
end

# create method to print unfinished activities
def print_todo_list(db)
	todo_list = db.execute("SELECT * FROM todo WHERE done='false'")
	today = Time.new.strftime("%B %d, %Y")
	puts "\nYour daily To-Do List for #{today}:"
	puts '*~'*20+'*'
	puts "todo_list"
	print todo_list
	todo_list.each { |act| puts act['id'] }
end

# create method to print detailed todo_list
def print_full(db)
	print_todo_list(db)
	todo_list = db.execute("SELECT * FROM todo WHERE done='true'")
	puts
	todo_list.each { |act| puts "#{act['activity']} - COMPLETE" }
end

# create method to print activities
def print_activities(db)
	todo_list = db.execute("SELECT * FROM activities")
	puts "\nHere are the available activities:"
	puts '*~'*20+'*'
	# is_included = to show if the activity is in the todolist
	todo_list.each { |act| puts "#{act['id']} - #{act['name']}" }
end

# create method to wipe table clean (always double checks!)
def delete_table(db)
	puts ('Are you sure you want to wipe the table? (y/n)')
	if gets.chomp == 'y'
		db.execute("DELETE FROM todo")
		db.execute("DELETE FROM log") 
	end
end

# create method to print a menu (return choice)
def print_menu(db)
	puts "\nChoose 1, 2, 3, or 4:"
	puts '1 - Add/Delete an activity to the activities list'
	puts '2 - Include/Remove an activity from the to-do list'
	puts '3 - Mark an activity as complete'
	puts '4 - Exit'
	choice = gets.chomp
	until ['1','2','3','4'].index(choice)
		puts 'Please choose either 1, 2, 3, or 4'
		choice = gets.chomp
	end
	choice
end

# create method to add/delete activities
def add_delete
	puts "Would you like to ADD or DELETE? (or EXIT)"
	add_delete = gets.chomp.upcase
	until ["ADD","DELETE","EXIT"].index(add_delete)
		puts "Please select ADD, DELETE, or EXIT"
		add_delete = gets.chomp.upcase
	end
	add_delete
end


# DRIVER CODE

# test check-in method
check_in(db)

# sets a default list of activities:
db.execute("DELETE FROM todo")
db.execute("DELETE FROM activities")
# db.execute("DELETE FROM log")
add_activity(db, "Ab Rolls")
add_activity(db, "Push Ups")
add_activity(db, "CodeWars Challenge")
add_todo(db,1)
add_todo(db,2)
add_todo(db,3)
add_todo(db,4)
delete_todo(db,4)
delete_activity(db, "Ab Rolls")
print_activities(db)

# print today's to-do list:
print_todo_list(db)
puts "print print_full"
print_full(db)
