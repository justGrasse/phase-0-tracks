# Justin's Daily To-Do List

# DOMAIN LOGIC (+ ORM w/SQLite3)

# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("todo.db")
db.results_as_hash = true

# create SQL command
create_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS todo(
		id INTEGER PRIMARY KEY,
		activity VARCHAR(255),
		done BOOLEAN
	) 
SQL

# create todo list table
db.execute(create_table_cmd)

# create method to add activities
def add_activity(db, activity)
	db.execute("INSERT INTO todo (activity, done) 
		VALUES (?, 'false')", [activity])
end

# create method to print unfinished activities
def print_todo_list(db)
	todo_list = db.execute("SELECT * FROM todo WHERE done='false'")
	puts "Here's your daily To-Do List:"
	puts '*~'*20+'*'
	todo_list.each do |activity|
		puts activity['activity']
	end
end

# create method to wipe table clean
def delete_table(db)
	puts ('Are you sure you want to wipe the table? (y/n)')
	if gets.chomp == 'y'
		db.execute("DELETE FROM todo")
	end
end


# DRIVER CODE

# test add_activity method
add_activity(db, "Push-ups")
print_todo_list(db)
delete_table(db)
print_todo_list(db)