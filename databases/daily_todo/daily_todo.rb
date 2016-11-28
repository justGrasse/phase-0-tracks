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
def delete_activity(db, act_id)
	db.execute("DELETE FROM activities WHERE id=?", [act_id])
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
def complete_activity(db, act_id)
	db.execute("UPDATE todo SET done='true' WHERE activity_id = ?", [act_id])
end

# create method to print unfinished activities
def print_todo_list(db)
	todo_list = db.execute("SELECT * FROM todo JOIN activities 
		ON activities.id = todo.activity_id AND todo.done='false'")
	today = Time.new.strftime("%B %d, %Y")
	puts "\nYour daily To-Do List for #{today}:"
	puts '*~'*20+'*'
	todo_list.each { |act| puts act['name'] }
end

# create method to print detailed todo_list
def print_full(db)
	print_todo_list(db)
	todo_list = db.execute("SELECT * FROM todo JOIN activities 
		ON activities.id = todo.activity_id AND todo.done='true'")
	todo_list.each { |act| puts "#{act['name']} - COMPLETE" }
end

# create method to print activities
def print_activities(db)
	todo_list = db.execute("SELECT * FROM activities")
	puts "\nHere are the available activities:"
	puts '*~'*20+'*'
	# is_included = to show if the activity is in the todolist
	todo_list.each { |act| puts "#{act['id']} - #{act['name']}" }
end

# create method to print unfinished activities with id's
def print_unfinished(db)
	todo_list = db.execute("SELECT * FROM todo JOIN activities 
		ON activities.id = todo.activity_id AND todo.done='false'")
	puts "\nUnfinished Activities for Today:"
	puts '*~'*20+'*'
	puts "ALL ACTIVITIES HAVE BEEN COMPLETED" if todo_list.empty?
	todo_list.each { |act| puts "#{act['id']} - #{act['name']}" }
end

# create method to print activities NOT on the todo list
def print_unused(db)
	act_list = db.execute("SELECT * FROM activities")
	todo_list = db.execute("SELECT activity_id FROM todo")
	puts "\nActivities Available (i.e. Not Being Used):"
	puts '*~'*20+'*'
	act_list.each { |act| 
		exists = false
		todo_list.each{ |todo_act| 
			exists = true if act["id"] == todo_act["activity_id"]
		}
		puts "#{act['id']} - #{act['name']}" if !exists 
	}
end

# create method to print a menu (return choice)
def print_menu(db)
	puts "\nDaily To-Do List Menu"
	puts '*~'*20+'*'
	puts "Choose 1, 2, 3, or 4:"
	puts '1 - Add/Delete an activity to the activities list'
	puts '2 - Add/Delete an activity from the to-do list'
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

# create method to wipe table clean (always double checks!)
def delete_table(db)
	puts ('Are you sure you want to wipe the table? (y/n)')
	if gets.chomp == 'y'
		db.execute("DELETE FROM todo")
		db.execute("DELETE FROM log") 
	end
end


# DRIVER CODE

# Test check-in method
check_in(db)

# Set a default list of activities/todo list:
db.execute("DELETE FROM todo")
db.execute("DELETE FROM activities")
add_activity(db, "Read a Chapter")
add_activity(db, "20 Push Ups")
add_activity(db, "15 Ab Rolls")
add_activity(db, "CodeWars Challenge")
add_activity(db, "Water Plants")
add_activity(db, "Run a Mile")
add_todo(db,1)
add_todo(db,2)
add_todo(db,3)
add_todo(db,4)
complete_activity(db,2)
complete_activity(db,4)

# Clean up the check-in log
# db.execute("DELETE FROM log")

# Print today's to-do list:
# print_todo_list(db)
# print_full(db)
# print_unfinished(db)
# print_unused(db)
