#Operate Store Phone Numbers
require 'sqlite3'
require 'faker'
require 'pry'


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

def delete_person(db)
  puts "who would you like to delete?"
  name = gets.chomp
  if actual_contact(db, name)
    db.execute("DELETE FROM phonebook WHERE name='#{name}'")
    return_all(db)
  else
    puts "#{name} is not in your phonebook"
  end
end

def info_parser(db, array)
  name = array[0]
  age = array[1]
  phone = array[2]
  add_person(db, name, age, phone)
end

def add_person(db, name, age, phone)
  db.execute("INSERT INTO phonebook (name, age, phone) VALUES (?, ?, ?)", [name, age, phone])
  puts return_user(db, name)
  start_phonebook(db)
end

def actual_contact(db, name)
  if db.execute("SELECT * from phonebook WHERE name =?", name)
    true
  else
    false
  end
end

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

#10.times do
#  create_people(db, Faker::Name.name, Faker::Number.between(19, 90), Faker::Number.number(10))
#end

def in_database(db, name_input)
  all_users = db.execute("SELECT * FROM phonebook")
  all_users.each do |user, info|
    if user['name'] == name_input
     return true
    end
  end
  false
end

def change_decider(db)
  correct_answer = false
  until correct_answer
    puts "What would you like to do (add/delete/update)?"
    change = gets.chomp
    if change == "add"
      correct_answer = true
      add_info(db)
    elsif change == "update"
      correct_answer = true
      update_user(db)
    elsif change == "delete"
      correct_answer = true
      delete_person(db)
    else
      puts "I didn't get that, type 'add', 'delete', 'update'"
    end
  end
end

def add_info(db)
  puts "Please give me the name, age, and phone number of the addition (separated by commas)."
  new_user = gets.chomp
  split_to_add(new_user, db)
end

def split_to_add(addition, db)
  array = addition.split(',')
  info_parser(db, array)
end

def start_phonebook(db)
  correct_answer = false
  until correct_answer
    puts "would you like to make a change?"
    input = gets.chomp
    if input == "yes"
      correct_answer = true
      change_decider(db)
      true 
    elsif input == "no"
      correct_answer = true
      puts "Glad I could help!"
      true
    else 
      false
    end
  end
end

def delete_info
  puts "Whom would you like to delete?"
  name_input = gets.chomp
  if in_database(db, name_input)
    delete_person(db, name_input)
    return_all(db)
    start_phonebook(db)
  else
    puts "I'm sorry, that name doesn't exist"
  end
end

def update_user(db)
  correct_answer = false
  until correct_answer
    puts "Whom would you like to update?"
    name_input = gets.chomp
    if in_database(db, name_input)
      correct_answer = true
      second_condition = false
      until second_condition
        puts "What would you like to update?"
        field = gets.chomp
        if field == "age"
          second_condition = true
          age(db, name_input)
        elsif field == "phone number"
          second_condition = true
          phone(db, name_input)
        else
          puts "I'm sorry, that's not a field you can populate"
        end
      end
    else
      puts "I'm sorry, that name is not in our database."
    end
  end
end

def age(db, name_input)
  puts "What would you like to update age to?"
  update = gets.chomp
  update_age(db, name_input, update)
  puts return_user(db, name_input)
  start_phonebook(db)
end

def phone(db, name_input)
  puts "What would you like to update phone number to?"
  update = gets.chomp
  update_phone(db, name_input, update)
  puts return_user(db, name_input)
  start_phonebook(db)
end


#DRIVER CODE
start_phonebook(db)
