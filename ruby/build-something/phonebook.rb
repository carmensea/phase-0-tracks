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

#is user making a change?
def start_phonebook(input)
  if input == "yes"
    true 
  elsif input == "no"
    true
  else 
    false
  end
end

def change_to_make(input)
  if input == "add"
    true
  elsif input == "delete"
    true
  elsif input == "update"
    true
  else
    false
  end
end

#10.times do
#  create_people(db, Faker::Name.name, Faker::Number.between(19, 90), Faker::Number.number(10))
#end

#DRIVER CODE
def return_user(db, name_input)
  user = db.execute("SELECT * from phonebook WHERE name =?", name_input)
  puts "#{user[0][1]} is #{user[0][2]} and the phone number is #{user[0][3]}"
end

def return_all(db)
  all_users = db.execute("SELECT * FROM phonebook")
  all_users.each do |user, info|
    puts "#{user['name']} is #{user['age']} and the phone number is #{user['phone']}"
  end
end

#set condition 
done_changes = false 
#Until the user says they are done making changes
until done_changes
#Ask user if they want to make a change to their contacts?
  puts "Would you like to make a change?"
  input = gets.chomp
    if !start_phonebook(input)
      puts "I didn't understand you"
    elsif start_phonebook(input)
        if input == "no"
          puts "Glad I could help!"
          done_changes = true
        else
          second_condition = false
          until second_condition 
            puts "What would you like to do (add/delete/update)?"
            do_this = gets.chomp
            if change_to_make(do_this)
              second_condition = true
                if do_this == "update"
                  puts "Whom would you like to update?"
                  name_input = gets.chomp
                  puts "What would you like to update?"
                  field = gets.chomp
                  puts "What would you like to update #{field} to?"
                  update = gets.chomp
                    if field == "age"
                      update_age(db, name_input, update)
                      puts return_user(db, name_input)
                    elsif field == "phone number"
                      update_phone(db, name_input, update)
                      puts return_user(db, name_input)
                    end
                elsif do_this == "delete"
                  puts "Whom would you like to delete?"
                  name_input = gets.chomp
                  delete_person(db, name_input)
                  return_all(db)
                elsif do_this == "add"
                  puts "Please give me the name, age, and phone number of the addition (separated by commas)."
                  addition = gets.chomp
                  array = addition.split(',')
                  info_parser(db, array)
                  puts return_user(db, array[0])
                end
            elsif !change_to_make(do_this)
              puts "I didn't understand you. Please type 'add', 'delete', or 'update'"
            end
          end
        end
    end
end


          #if !actual_contact(db, name_input) 
          #  puts "I'm sorry, we don't have #{name_input} in the phonebook}. Would you like to add them or try again? ('add' 'try again')"
          #  answer = gets.chomp
          #  if answer == add
          #    
          #  end
