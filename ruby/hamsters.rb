 puts "what's your name?"
 name = gets.chomp.capitalize

 puts "How loud are you from 1-10?"
 volume_level = gets.chomp.to_i

 puts "What's your fur color?"
 fur_color = gets.chomp

 puts "Are you a good canidate for adoption?(yes/no)"
 adoptable = gets.chomp

 puts "How old are you?"
 age = gets.chomp

	if adoptable == "yes" || adoptable =="true"
	  adoptable = true
	elsif adoptable =="no" || adoptable == "false"
	  adoptable = false
	end
	
	if age == ""
	   age = "nil"
	else
	  age.to_i
	end

puts "#{name} is #{age} years old with #{fur_color} fur. #{name}'s volume level is #{volume_level}. #{name}'s adoptablility = #{adoptable}."
