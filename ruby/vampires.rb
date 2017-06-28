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
  wants_garlic = wants_garlic == "yes" ? true : false
  wants_healthcare = wants_healthcare == "yes" ? true : false
  
  if current_year - (birth_year.to_i + 1) == age || current_year - (birth_year.to_i) == age
    age = true
  else
    age = false
  end

  if name == "Drake Cula" || name == "Tu Fang"
    name = false
  else
    name = true
  end

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
    result = "low"
  end

  if !age && (!wants_garlic || !wants_healthcare)
    result = "medium"
  end

  if !age && (!wants_garlic && !wants_healthcare)
    result = "high"
  end

  if !name 
    result = "higher"
  end

  if vampire
    result = "medium"
  end

  #Result updated for user 
  if result == "low"
    result = "Probably not a vampire"
  elsif result == "medium"
    result = "Probably a vampire"
  elsif result == "high"
    result = "Almost certainly a vampire"
  elsif result == "higher"
    result = "Definitely a vampire"
  else
    result = "Results inconclusive"
  end
  
  p result

  counter += 1
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

