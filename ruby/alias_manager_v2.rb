require 'pry'

#Change all vowels to the next vowel
#Changle all consonants to the next consonant


def alphabet
  alphabet = {
    vowels: ["a","e","i","o","u"],
    cap_vowels: ["A","E","I","O","U"],
    consonants: ["b","c","d","f","g","h","k","l","m",
                  "n","p","q","r","s","t","v","w","x",
                  "y","z"],
    cap_consonants: ["B","C","D","F","G","H","J",
                  "K","L","M","N","P","Q","R","S","T","V",
                  "W","X","Y","Z"]
  }
  alphabet
end

def name_taker
  puts "What is your name?"
  real_name = gets.chomp
  name_array = real_name.split('')
  name_array
end

def swaperoo(name_array)
  new_name = []
  
  letter_types = [:vowels, :cap_vowels, :consonants, :cap_consonants]

  name_array.each do |letter|
    letter_types.each do |type|
      if letter == alphabet[type][-1]
        new_name.push(alphabet[type][0])
        break
      elsif letter == " "
        new_name.push(" ")
        break
      elsif alphabet[type].include?(letter)
        new_position = alphabet[type].index(letter)+1
        new_name.push(alphabet[type][new_position])
        break
      end
    end
  end
  new_name = new_name.join
end

binding.pry
p swaperoo(name_taker)

