#Taking spies real name as input
#outputting a fake name by
#   -swapping first and last name
#   -changing all vowels to next vowel
#   -changing all consonants to next consonant


def fake_name
  alphabet = {
    vowels: ["a", "e", "i", "o", "u"],
    consonants: ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
                 "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
  }

  type_quit = false

  until type_quit
    puts "What is your name?"
    real_name = gets.chomp

    real_name = real_name.downcase.split('')

    new_letters = []

    real_name.each do |letter|
      if alphabet[:vowels][-1] == letter
        new_vowel_position = alphabet[:vowels][0]
        new_letters.push(new_vowel_position)
      elsif letter == " "
        new_letters.push(" ")
      elsif alphabet[:consonants][-1] == letter
        new_consonant_position = alphabet[:consonants][0]
        new_letters.push(new_consonant_position)
      elsif alphabet[:vowels].include?(letter)
        new_vowel_position = alphabet[:vowels].index(letter)+1
        new_letters.push(alphabet[:vowels][new_vowel_position])
      elsif
        alphabet[:consonants].include?(letter)
        new_consonant_position = alphabet[:consonants].index(letter)+1
        new_letters.push(alphabet[:consonants][new_consonant_position])
      end
    end
    new_name = new_letters.join
    p new_name
    
    puts "Add a new name or type 'quit' when you are satisfied"
    real_name = gets.chomp
      
      if real_name == "quit"
        type_quit = true
      end
  end

end

fake_name
