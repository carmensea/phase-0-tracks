require 'pry'
# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----
def print_supplies(array)
  zombie_apocalypse_supplies.each do |item|
    print "#{item} * "
  end
end

# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----

def sort_alpha(array)
  new_array = []
  new_array.push(array[0])

  #for every item in the array, except for one, because it moved to the new array
  for i in 1..array.length-1
    #check each item against what is in new array
    for j in 0..new_array.length-1
      #if item is greater than new array item
      if array[i] < new_array[j]
        #stick it in at that position
        new_array.insert(j, array[i])
        break
      #if item is less than new array item
      elsif j == new_array.length-1 
        new_array.push(array[i])
        break
      end
    end
  end
  new_array
end

#p sort_alpha(zombie_apocalypse_supplies)

# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----
def check_if(array, string)
  #loop thru each item in array
  array.each do |check|
    #check if item in array matches string
    if string == check
      puts "Yes, we have a #{string}"
      return true
    end
  end
  puts "We don't have a #{string}"
  false
end

#check_if(zombie_apocalypse_supplies, "CB radio")

# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----

def carry_only(array, number)
  until array.length <= number
    if array.length > number
      array.delete_at(number - 1)
    end
  end
  array
end
#p carry_only(zombie_apocalypse_supplies, 5)

# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
# ----

def delete_dups(array1, array2)
  array1.each do |item|
    array2.push(item)
  end
  array2.uniq
end

#p delete_dups(other_survivor_supplies, zombie_apocalypse_supplies)
# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----
def asterisk_printer(hash)
  hash.each do |animal, year|
    print "#{animal} - #{year} * "
  end
  hash
end

#asterisk_printer(extinct_animals)

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----

def extinct_before(hash)
  hash.each do |animal, year|
    if year < 2000
      hash.delete(animal)
    end
  end
  hash
end

#p extinct_before(extinct_animals)
# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----

def update_extinction(hash)
  hash.each do |animal, year|
    hash[animal] += 3
  end
  hash
end
#p update_extinction(extinct_animals)

# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----
animals_to_check = ["Andean Cat", "Dodo", "Saiga Antelope"]
def are_extinct?(array, hash)
  array.each do |animal|
    if hash[animal]
      puts "#{animal} is extinct"
    else
      puts "#{animal} is not extinct"
    end
  end
end
#are_extinct?(animals_to_check, extinct_animals)

# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----

p extinct_animals.rassoc(1914)

