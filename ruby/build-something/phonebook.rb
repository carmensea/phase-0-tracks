#Operate Store Phone Numbers
require 'sqlite3'
require 'faker'


#create SQLite3 database
db = SQLite3::Database.new("phonebook.db")
db.results_as_hash = true

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

def update_age(db, name, update)
  db.execute("UPDATE phonebook SET age=#{update} WHERE name='#{name}'")
end

def update_phone(db, name, update)
  db.execute("UPDATE phonebook SET phone=#{update} WHERE name='#{name}'")
end

def delete_person(db, name)
  db.execute("DELETE FROM phonebook WHERE name='#{name}'")
end

def array_maker(db, information)
  info_array = information.split(',')
  info_parser(db, info_array)
end

def info_parser(db, array)
  name = array[0]
  age = array[1]
  phone = array[2]
  add_person(db, name, age, phone)
end

def add_person(db, name, age, phone)
  db.execute("INSERT INTO phonebook (name, age, phone) VALUES (?, ?, ?)", [name, age, phone])
end

def actual_contact(db, name)
  if db.execute("SELECT * from phonebook WHERE name =?", name)
    true
  else
    false
  end
end

def start_phonebook(input)
  if input == "yes"
    true 
  else
    false
  end
end

#10.times do
#  create_people(db, Faker::Name.name, Faker::Number.between(19, 90), Faker::Number.number(10))
#end

#DRIVER CODE

#Ask user if they want to make a change to their contacts?
done_changes = false 
until done_changes
  puts "Would you like to make a change?"
  input = gets.chomp
  if start_phonebook(input)
    update_condition = false
    until update_condition 
      puts "What would you like to do (add/delete/update)?"
      do_this = gets.chomp
        if do_this == "update"
          update_condition = true
          puts "Whom would you like to update?"
          name_input = gets.chomp
          if !actual_contact(db, name_input) 
            puts "I'm sorry, we don't have #{name_input} in the phonebook}. Would you like to add them or try again? ('add' 'try again')"
            answer = gets.chomp
            if answer == add
              
            end
          puts "What would you like to update?"
          field = gets.chomp
          puts "What would you like to update #{field} to?"
          update = gets.chomp
            if field == "age"
              update_age(db, name_input, update)
              return_user =  db.execute("SELECT * from phonebook WHERE name =?", name_input)
              puts "#{return_user[0][1]} is #{return_user[0][2]} and the phone number is #{return_user[0][3]}"
            elsif field == "phone number"
              update_phone(db, name_input, update)
              puts return_user(db, name_input)
            end
        elsif do_this == "delete"
          update_condition = true
          puts "Whom would you like to delete?"
          name_input = gets.chomp
          delete_person(db, name_input)
        elsif do_this == "add"
          update_condition = true
          puts "Please give me the name, age, and phone number of the addition (separated by commas)."
          addition = gets.chomp
          array_maker(db, addition)
        else 
          puts "I didn't understand you. What change do you want to make?"
        end
    end
  elsif input == "no"
    puts "Great! Glad I could help!"
    condition = true
  else 
    puts "I didn't understand you. Please answer 'yes' or 'no'"
  end
end


