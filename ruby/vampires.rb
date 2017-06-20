puts "How many employees will be processed?"
number_employees = gets.chomp

current_year = 2017
counter = 0

while counter <= number_employees.to_i - 1
  puts "What is your name?"
  name = gets.chomp
  
  puts "How old are you?"
  age = gets.chomp
  
  puts "What year were you born?"
  birth_year = gets.chomp
  
  puts "Our company cafeteria serves garlic bread. Should we order some for you?"
  wants_garlic = gets.chomp
  
  puts "Would you like to enroll in the company's health insurance?"
  wants_healthcare = gets.chomp

  condition = true

  while condition
    puts "Please list any allergies one at a time. Please type done when finished"
    allergies = gets.chomp
    if allergies == "sunshine"
      condition = false
      vampire = true
    elsif allergies == "done"
      condition = false
    end
  end

  if name == "Drake Cula" || name =="Tu Fang" || allergies == "sunshine" || vampire == true
    puts "Definitely a vampire"
  elsif(current_year - birth_year.to_i == age.to_i) && (wants_garlic == "yes" || wants_healthcare == "yes")
    puts "Probably not a vampire"
  elsif (current_year - birth_year.to_i != age.to_i) && (wants_garlic == "no" && wants_healthcare == "no")
    puts "Almost certainly a vampie"
  elsif (current_year - birth_year.to_i != age.to_i) && (wants_garlic == "no" || wants_healthcare == "no")
    puts "Probably a vampire"
  else
    print "Results inconclusive."
  end
  counter += 1
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

