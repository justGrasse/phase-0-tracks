# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end


# write a GET route that retrieves
# all student data
# IF there is a passed in parameter 
# this will display ONLY names that contain that string
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  name = params[:name]
  students.each do |student|
    if !name || student['name'].downcase[name.downcase]
      response << "ID: #{student['id']}<br>"
      response << "Name: #{student['name']}<br>"
      response << "Age: #{student['age']}<br>"
      response << "Campus: #{student['campus']}<br><br>"
    end
  end
  # if response.length == 0
  #   "Sorry, no matches. =["
  # else
    response
  # end
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET route that 
# prints an address

get '/contact' do
  address = ""
  address << "Harry Potter<br>"
  address << "4 Privet Drive<br>"
  address << "Little Whinging, Surrey"
  address
end


# write a GET route that 
# takes a name parameter

get '/great_job' do
  name = params[:name]
  if name
    "Great job, #{name}!"
  else
    "Great Job!"
  end
end


# write a GET route that 
# adds 2 numbers

get '/:num_1/plus/:num_2' do
  num_1 = params[:num_1]
  num_2 = params[:num_2]
  "#{num_1} + #{num_2} = #{num_1.to_i+num_2.to_i}"
end
