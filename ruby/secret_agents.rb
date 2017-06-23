# If Encrypy:
#   Given the letter, find the next letter
#   Output next letter
#   If space, stays a space
# If Decrypt:
#   Given encrypted letter, find the preceeding letter
#   Output preceeding letter
#   If space, stays a space

# Encrypts string
def encrypt(str)
  encrypted_string = ""                             #Sets empty string 
  num_letters = str.length                          #Sets string length to variable
  counter = 0                                       #Start counter

  until counter == num_letters                      #For every letter in the string 
    current_letter = str[counter]                   #Current letter is set to the counter
    if current_letter == 'z'                        #If current letter is Z
      encrypted_string += 'a'                       #Add new letter to encrypted string
    elsif current_letter == " "
      encrypted_string += " "
    else
      encrypted_string += str[counter].next         #Otherwise next letter in counter is added to encrypted string. 
    end
    counter += 1                                    #Increase counter by 1
  end
  puts encrypted_string                             #Return value
end

#puts encrypt('zed')                                 #Call and return function

# Decrypts string
def decrypt(str)
  alphabet = "abcdefghijklmnopqrstuvwxyz"           #Alphabet
  num_letters = str.length                          #Sets length of string to variable
  decrypted_string = ""                             #Set empty string
  counter = 0                                       #Start counter
  until counter == num_letters                      #For every letter until length string
    current_letter = str[counter]                   #Setting current letter to the counter
    if current_letter == 'a'                        #If current letter is A
      decrypted_string += 'z'                       #Add to decrypted string
    elsif current_letter == " "
      decrypted_string += " "
    else
      decrypted_string += alphabet[alphabet.index(current_letter)-1]  #Add previous letter by taking the current letter's position - 1 and using that to find the value. 
    end
    counter += 1                                    #Increase counter
  end
  puts decrypted_string
end

#OUR DRIVER CODE

#Prompts agent for encrypting or decrypting
puts "Hello Agent, are you encrypting or decrypting today?"
selection = gets.chomp

#Prompts agent for password
puts "Please enter your password"
str = gets.chomp

# Decides which method to follow
if selection == "encrypting"
  encrypt(str)
elsif selection == "decrypting"
  decrypt(str)
end
#puts decrypt("afe")

#puts decrypt(encrypt("swordfish"))                  #This nested function is first encrypting "swordfish" and then decrypting it. 

