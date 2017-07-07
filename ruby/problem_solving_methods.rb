require 'pry'

def search_for(array, integer)
  answer = ""
  array.length.times do |position|
    value = array[position]
    if value == integer
      answer = "#{integer} is in the array"
      break
    else
      answer = "#{integer} is not in array"
    end
  end
 p answer
end

#array_numbers = [1,2,4,5]

#search_for(array_numbers, 4)

def fib(number)
  #need an empty array to put numbers into
  array = []
  #for the numbers leading up to the given number
  for i in 0..number-1
    if i == 0
      array.push(0)
    elsif i == 1
      array.push(1)
    else
      array.push(array[i-2] + array[i-1])
    end
  end
  array
end

p fib(1)

def insertion_sort(array)
  #initialize new array
  new_array = []

  #push first integer to array
  new_array.push(array[0])

  #loop through the array the length minus 1 (because we already took the first integer, so now it's less one
  for i in 1..array.length-1
    #set variable to the length of the array currently (doesn't change)
    new_array_length = new_array.length 
    #loop through new_array minus 1 because array length is 1, but counter starts at 0.  
    for j in 0..new_array_length-1
      #if current value is less or equal to new array items
      if array[i] <= new_array[j]
        #insert item before position (j)
        new_array.insert(j, array[i])
        #break if this is met
        break
      end
      #if we reach the end of the new array and it's false (not smaller), push to end of array
      if j == new_array_length-1 
        new_array.push(array[i])
        break
      end
    end
  end
  new_array
end

p insertion_sort([5,4,25,1,27,4,65365,77,3,7])


