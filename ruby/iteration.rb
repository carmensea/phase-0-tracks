#ARRAY
attendence = ["Rachel", "Gemma", "Hayley", "BillyBob"]

p attendence

attendence.each do |name|
  puts name
end

p attendence

attendence.map! do |name|
  puts name
  attendence.upcase
end

p attendence

#HASH
attendence = {
  rachel: "here",
  gemma: "not here",
  hayley: "here",
  billybob: "not here"
}

p attendence

attendence.each do |name, here|
  puts "#{name} is #{here}"
end

p attendence

# *** release 2***
# 1
release_2_array = ["a", "b", "c", "d"]
release_2_hash = {
  one: "1",
  two: "2",
  three: "3",
  four: "4",
}
puts "before .each"
p release_2_array
p release_2_hash

release_2_array.delete_if {|letter| letter == "b"}

release_2_hash.delete_if {|word, fixnum| fixnum < "4"}

puts "after.each"

p release_2_array
p release_2_hash

#2
filter = release_2_array.select { |letter| letter == "a"}
p filter

release_2_hash[:five] =  "5"
p release_2_hash

filter_hash = release_2_hash.select { |word, fixnum| fixnum == "5"}
p filter_hash


#3
puts "before.push"
p filter
p filter_hash


filter.push("b", "c", "d")
filter2 = filter.reject { |letter| letter == "a"}

filter_hash[:six] =  "6"

filter_hash2 = filter_hash.fetch(:five)
puts "after.push"
p filter2
p filter_hash2

#4

filter.push("b", "c", "d")
filter3 = filter.drop_while { |letter| letter < "z"}
puts "after .reject"
p filter3

last_hash = {
  name: "cortney",
  age: "22", 
  pets: "dog"
}

last_hash.delete_if { |lable, value| value != nil}
p last_hash

