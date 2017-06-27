def questions
  #initialize empty hash
  details = {}
  
  #surveys client
  puts "Client name?"
  #adds key and value to hash
  details[:name] = gets.chomp
  puts "Client age?"
  details[:age] = gets.chomp
  puts "Number of children?"
  details[:kid_total] = gets.chomp.to_i
  puts "Decor theme?"
  details[:theme] = gets.chomp
  puts "Likes earth tones?"
  details[:earth_tones] = gets.chomp

  #prints the key and value
  p details
  
  #prompts user for any updates
  puts "Would you like to update any of you choices? Type 'none' if not."
  input = gets.chomp

  if input == "none"
    p details
  else
    #prompts user for update value
    puts "What is the update?"
    update = gets.chomp
    #takes input and changes it to a symbol, then takes update value to 
    #update the value.
    details[input.to_sym] = update
  end

  p details

end

questions
