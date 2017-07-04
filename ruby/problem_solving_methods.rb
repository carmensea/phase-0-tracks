require "pry"

# Release 0
def search_array(array, number)
  position = nil
  array.length.times do |index|
    # Check array[index] == number
    position = index if array[index] == number
  end
  return position
end

# p search_array([1,2,3,4,5],10)

# Release 1
def fibonacci(number)
  # Create an Array
  # Fill array with Fibonacci sequence
  #   Push sum of array[i], array[i+1]
  fibonacci_sequence = []
  first = 0
  second = 1 
  fibonacci_sequence.push(first, second)
  #  for i in 2..number do
  #  fibonacci_sequence.push(first + second)
  i = 2
  while i < number do
    sum = first + second
    fibonacci_sequence.push(sum)
    temporary = second
    first = temporary
    second = sum 
    i += 1
  end 
  fibonacci_sequence
end

#p fibonacci(6)
#p fibonacci(100)[-1] == 21892299583455516902

#Release 2 

#Given an array of integers
#Compare first two integers
#   if I2 < I1
#   move I1 to array[0]
# Compare array[1] to array[2]
#   if I3 < I1
#   move I3 to array[1]
#[5,4,25,1])
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


