# Justin's Daily To-Do List

# DOMAIN LOGIC (+ ORM w/SQLite3)

# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("todo.db")
db.results_as_hash = true

# create SQL command for todo table
create_todo_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS todo(
		id INTEGER PRIMARY KEY,
		activity VARCHAR(255),
		done BOOLEAN
	) 
SQL

# create SQL command for time log table
create_log_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS log(
		id INTEGER PRIMARY KEY,
		day INT,
		time INT
	) 
SQL

# create todo list tables
db.execute(create_todo_table_cmd)
db.execute(create_log_table_cmd)

# create  check-in that logs your time
def check_in(db)
	currentArr = Time.new.to_s.split(' ')
	dayArr = currentArr[0].split('-').join('').to_i
	timeArr = currentArr[1].split(':').join('').to_i
	db.execute("INSERT INTO log (day, time) 
		VALUES (?, ?)", [dayArr, timeArr])
end

# create method to add activities
def add_activity(db, activity)
	db.execute("INSERT INTO todo (activity, done) 
		VALUES (?, 'false')", [activity])
end

# create method to print unfinished activities
def print_todo_list(db)
	todo_list = db.execute("SELECT * FROM todo WHERE done='false'")
	today = Time.new.strftime("%B %d, %Y")
	puts "\nYour daily To-Do List for #{today}:"
	puts '*~'*20+'*'
	todo_list.each do |activity|
		puts activity['activity']
	end
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

# test add_activity method
check_in(db)
add_activity(db, "Ab Rolls")
add_activity(db, "Push Ups")
add_activity(db, "CodeWars Challenge")
print_todo_list(db)
delete_table(db)
print_todo_list(db)