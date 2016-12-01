# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

get '/grade' do
  @grades = 100
  @message = "What you wish your grade was: "
  erb :grade
end

get '/grade/real' do
  # db.results_as_hash = false
  # rng_array=db.execute("SELECT students.age FROM students")
  puts "This is GET /grade/real"
  @grades = Random.rand(1..100)
  @message = "What your ACTUAL grade is: "
  puts "@grades is #{@grades}"
  erb :grade
end

get '/grade/grade/real' do
  redirect '/grade/real'
end

get '/campus' do 
  @campuses = db.execute("SELECT name, ABR FROM campuses")
  erb :campus
end

post '/campus' do
  name = params['name']
  abbr = params['abbr']
  db.execute("INSERT INTO campus (name, ABR) VALUES (?,?)",[name, abbr])
  redirect '/campus'
end


# add static resources