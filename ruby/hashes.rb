#method that asks users preferences and stores them in a hash
def survey
  profile = {}
  puts "Name"
  profile[:name] = gets.chomp
  puts "Address"
  profile[:address] = gets.chomp
  puts "Email"
  profile[:email] = gets.chomp
  puts "Phone"
  profile[:phone] = gets.chomp
  puts "Favorite shade of blue?"
  profile[:fav_shade] = gets.chomp
  puts "Wallpaper preference?"
  profile[:wallpaper] = gets.chomp
  puts "Ombre is?"
  profile[:ombre] = gets.chomp

  profile
end

#method that updates hash with new label
def update_add_val(hash)
  puts "Please specify a label you'd like to update, otherwise type 'none.'"
  update = gets.chomp
  
  if update  == "none"
    p hash
  else
    puts "Please update #{update}"
    new_value = gets.chomp
    hash[update.to_sym] = new_value
  end
  hash
end

#Call update_add_val method with survey method's return value (the profile hash)
p update_add_val(survey)  
