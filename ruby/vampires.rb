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

#If the employee got their age right, and is willing to eat garlic bread 
#or sign up for insurance, the result is “Probably not a vampire.”
current_year = 2017

if name == "Drake Cula" || name =="Tu Fang"
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

