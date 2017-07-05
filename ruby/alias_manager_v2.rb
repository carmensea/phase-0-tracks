require 'pry'
#Prompt user for name

#method for all letters and catch alls.
def letterbank
  {
    vowels: ["a","e","i","o","u"],
    cap_vowels: ["A","E","I","O","U"],
    consonants: ["b","c","d","f","g","h","j","k","l","m",
                 "n","p","q","r","s","t","v","w","x","y","z"],
    cap_consonants: ["B","C","D","F","G","H","J","K","L","M",
                     "N","P","Q","R","S","T","V","W","X","Y","Z"],
    catch_all: [" ", "@", ".", "-"]
  }
end

#Prompt user for name
def name_taker
  condition = false
  alias_history = {}
  until condition
    puts "What is your name?"
    input = gets.chomp
    if input == "quit"
      condition = true
      break
    else
      new_name = swapper(input)
      alias_history[input] = new_name.join
    end
  end
  sentence_maker(alias_history)
end

def sentence_maker(hash)
  hash.each do |real, fake|
    puts "#{real} is your real name, and #{fake} is your alias."
  end
  hash
end


def swapper(name)
  #for cycling through each type of key
  letter_type = [:vowels, :cap_vowels, :consonants, :cap_consonants, :catch_all]
  #for storing new name letters
  new_name = []
  #for cycling through each letter
  name_array = name.split('')

  name_array.each do |letter|
    letter_type.each do |type|
      if letter == letterbank[type][-1]
        new_name.push(letterbank[type][0])
        break
      elsif letterbank[type].include?(letter)
        new_letter_position = letterbank[type].index(letter)+1
        new_name.push(letterbank[type][new_letter_position])
        break
      end
    end
  end
  new_name
end


binding.pry
p name_taker
