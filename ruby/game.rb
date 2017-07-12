require 'pry'

class Hangman
  attr_reader :word, :letter_array
  attr_accessor :counter, :correct_letters, :guess_history

  def initialize(string)
    @word = string
    @counter = string.length
    @guess_history = []
    @letter_array = @word.split("")
    @correct_letters = setter(@letter_array)
  end

  #setting up new array
  def setter(array)
    @correct_letters = []
    #each letter goes into
    array.each do |letter|
      #value of key is a dash
      @correct_letters.push("-")
    end
    @correct_letters
  end

  def position(letter)
    @letter_array.each_index.select{ |i| @letter_array[i] == letter}
  end

  #letter loop
  def guess(letter)
    if @letter_array.include?(letter)
      positions = position(letter)
      if positions.length == 1 
        @correct_letters[positions[0]] = letter
        puts "You guessed the correct letter!"
        p @correct_letters
      elsif positions.length > 1
        positions.each do |other|
          @correct_letters[other] = letter 
        end
        puts "You guessed correctly!"
        p @correct_letters
      end
    else
      if @guess_history.include?(letter)
        puts "Sorry, you guessed #{letter} already. Try again"
      else
        @guess_history.push(letter)
        @counter -= 1
        puts "Sorry, #{letter} is not a letter in the word."
        puts "You now have #{@counter} guesses left"
      end
    end
  end
  
  def start
    puts "Cranking up the game..."
    until @counter == 0 || @correct_letters == @letter_array
      puts "Guess a letter"
      letter = gets.chomp
      guess(letter)
    end
  end
end

#game = Hangman.new("zoo")
#game.start

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
