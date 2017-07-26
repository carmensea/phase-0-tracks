#Operate Store Phone Numbers

require 'sqlite3'
require 'faker'

#create SQLite3 database
db = SQLite3::Database.new("phonebook.db")

#create a create command in SQL
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS phonebook(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  phone INT
  )
SQL

#create the phonebook table
db.execute(create_table_cmd)


def create_people(db, name, age, phone)
  db.execute("INSERT INTO phonebook (name, age, phone) VALUES (?, ?, ?)", [name, age, phone])
end

def update_age(db, name, age)
  db.execute("UPDATE phonebook SET age=#{age} WHERE name='#{name}'")
end

#10.times do
#  create_people(db, Faker::Name.name, Faker::Number.between(19, 90), Faker::Number.number(10))
#end

#DRIVER CODE

#Ask user if they want to make a change to their contacts?
puts "Would you like to make a change?"
input = gets.chomp
if input == "yes"
  puts "Who would you like to update?"
  name_input = gets.chomp
  puts "What would you like to update?"
  field = gets.chomp
  puts "What would you like to update #{field} to?"
  update = gets.chomp
  update_age(db, name_input, update)
end


