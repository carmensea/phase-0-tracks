#Taking spies real name as input
#outputting a fake name by
#   -swapping first and last name
#   -changing all vowels to next vowel
#   -changing all consonants to next consonant


def fake_name
  type_quit = false
  alias_history = {}

  until type_quit
    puts "Type a name for an alias or type 'exit' to quit"
    real_name = gets.chomp

    if real_name == "quit"
      type_quit = true
    else 
      new_name = to_alias(real_name)
      alias_history[real_name] = new_name 
    end
  end
  print_sentences(build_sentences(alias_history))
end

def build_sentences(names)
  full_sentence = []
  names.each do |real_name, fake_name|
    full_sentence.push("#{fake_name} is actually #{real_name}")
  end
  full_sentence
end

def print_sentences(array)
  array.each do |sentence|
    p sentence
  end
end

def alphabet
  {
    vowels: ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"],
    consonants: ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
                 "n", "p", "q", "r", "s", "t", "v", "w", "x", "y",
                  "z", "B", "C", "D", "F", "G", "H", "J", "K", "L",
                  "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X",
                  "Y", "Z"]
  }
end

def to_alias(name)
  name = name.split('')

  new_letters = []

  name.each do |letter|
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
  new_letters.join
end

fake_name
