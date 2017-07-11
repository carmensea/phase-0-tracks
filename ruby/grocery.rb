# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# create empty hash
def grocery_list(string)
  grocery = {}
  array = string.split(" ")
# take string split the array on spaces
# steps: 
  # use .each to iterate over array
  array.each do |item|
    grocery[item] = 1
  end
  grocery
end

grocery_list = grocery_list("cats")
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

# Method to add an item to a list
  def add(list, item, quantity)
    list[item] = quantity
    list
  end

p add(grocery_list, "lemonade", 2)
p add(grocery_list, "tomatoes", 3)
p add(grocery_list, "onions", 1)
p add(grocery_list, "ice cream", 4)


#p add(grocery_list, "lemonade", 1)
# input: list, item name, and optional quantity
# steps:
    #add item as key and quantity as value to grocery hash
# output:
    #output updated grocery list

# Method to remove an item from the list
# input
# steps:
    # use delete method on hash (find it by key and value)
# output:
    # updated grocery list

  def remove(list, item)
    list.delete(item)
    list
  end

p remove(grocery_list, "cats")
p remove(grocery_list, "lemonade")
#p remove(grocery_list, "lemonade")

# Method to update the quantity of an item
# input:
    # input takes list, item, quantity
# steps:
    # list[item] = new quantity
# output:
    # updated grocery list

  def update(list, item, quantity)
    list[item] = quantity
    list
  end

p update(grocery_list, "ice cream", 1)
#p update(grocery_list, "carrots", 4)

# Method to print a list and make it look pretty
# input: 
    # takes list
# steps:
    # puts list
# output:
    # pretty list

  def nice_output(list)
    list.each do |item, quantity|
      puts "We need #{quantity} #{item}"
    end
  end

nice_output(grocery_list)


#I learned that I'm better at half pseudocoding and half coding.
#It made sense to use them both. Arrays to split the string and hashes
  #to update and remove items.
#You can pass hashes, arrays, strings, integers
#Your method will return a value and you can set it equal to a variable
  #that variable can be used later as an input in a new method
#I realized that I don't have to use a loop to do basic things like adding or
  #removing items from an array. 
