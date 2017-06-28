puts "How many employees will be processed?"
number_employees = gets.chomp

current_year = Time.now.year
counter = 0

while counter <= number_employees.to_i - 1
  puts "What is your name?"
  name = gets.chomp
  
  puts "How old are you?"
  age = gets.chomp.to_i
  
  puts "What year were you born?"
  birth_year = gets.chomp
  
  puts "Our company cafeteria serves garlic bread. Should we order some for you?"
  wants_garlic = gets.chomp
  
  puts "Would you like to enroll in the company's health insurance?"
  wants_healthcare = gets.chomp

  condition = true
  
  #Conditonal to Booleans
  wants_garlic = wants_garlic == "yes" 
  wants_healthcare = wants_healthcare == "yes" 
  age = (current_year - (birth_year.to_i + 1) == age || current_year - (birth_year.to_i) == age)
  name = name == "Drake Cula" || name == "Tu Fang" 

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

  #Survey yields results
  if age && (wants_garlic || wants_healthcare) 
    result = "Probably not a vampire"
  end

  if vampire || (!age && (!wants_garlic || !wants_healthcare))
    result = "Probably a vampire"
  end

  if !age && (!wants_garlic && !wants_healthcare)
    result = "Almost certainly a vampire"
  end

  if name 
    result = "Definitely a vampire"
  end

  if result == nil
    result = "Results inconclusive"
  end
  
  p result

  counter += 1
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

