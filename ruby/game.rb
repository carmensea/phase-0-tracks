require 'pry'

class Hangman
  attr_reader :word, :letter_array
  attr_accessor :counter, :correct_letters, :guess_history

  def initialize(string)
    @word = string
    @counter = string.length
    @guess_history = []
    @letter_array = @word.split("")
    @correct_letters = set_answer_bank(@letter_array)
  end
  
  def display_answer
    string = ""
    @correct_letters.each do |letter|
      string += "#{letter} "
    end
    string
  end

  #setting up new array
  def set_answer_bank(array)
    @correct_letters = []
    #each letter goes into
    array.each do |letter|
      #value of key is a dash
      @correct_letters.push("_")
    end
    @correct_letters
  end

  def guess(letter)
    if @letter_array.include?(letter)
      record_right_letter(letter)
      true
    else
      if !same_wrong_guess?(letter)
        record_wrong_letter(letter)
      end
      false
    end
  end

  def position(letter)
    @letter_array.each_index.select{ |i| @letter_array[i] == letter}
  end
  
  def record_right_letter(letter)
    positions = position(letter)
    positions.each do |other|
      @correct_letters[other] = letter 
    end
    true
  end

  def record_wrong_letter(letter)
    @guess_history.push(letter)
    @counter -= 1
    true
  end

  def same_wrong_guess?(letter) 
    if @guess_history.include?(letter)
      true
    else
      false
    end
  end

  def complete?
    @counter == 0 || @correct_letters == @letter_array
  end
end

def driver_code
  game = Hangman.new("zoom")
  p game.display_answer
  until game.complete?
    puts "guess a letter"
    letter = gets.chomp
    if game.guess(letter)
      puts "Great job."
    else
      puts "Sorry, you guessed the wrong letter"
      if game.same_wrong_guess?(letter)
        puts "You already guess this one. This won't count against you."
      end
      puts "You have #{game.counter} guesses left."
    end
    p game.display_answer
  end
  
  if @correct_letters == @letter_array
    p game.display_answer
    puts "You guessed #{game.correct_letters.join}, the correct word!"
    true
  else
    puts "You're a failure."
    false
  end
end

#driver_code
#Given a word
#For each letter in the array
  #a - will be returned to p2
#Prompt p2 to guess p1's letters based on the dashes
  #Store p2 letter's in a new array 
    #If p2 guesses the same letter again
      #Letter does not count against them
    #If p2 guesses a correct letter
      #Find the position of the letter in p1 aray
      #Return the dashes with the updated letter in the correct position
    #If the word is guessed
      #Congratulate the user with "Great job! You're so smart"
    #If the word isn't guess
      #Taunt the user with "You're a loser!"
