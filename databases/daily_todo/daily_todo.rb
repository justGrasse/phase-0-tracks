# Justin's Daily To-Do List

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
	db.execute("INSERT INTO todo (activity) VALUES (?)", [activity])
end

# test add_activity method
add_activity(db, "Push-ups")