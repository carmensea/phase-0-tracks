require 'pry'
class Santa
  attr_reader :age, :ethnicity
  attr_accessor :gender

  def initialize(gender, ethnicity, color, language, age)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @age = 0
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", 
                         "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @color = color 
    @language = language
  end

  def speak
    puts "Ho, ho, ho! Haaaapy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie} cookie!"
  end

  def celebrate_birthday
    @age += 1 
    @age
  end

  def get_mad_at(name)
    @reindeer_ranking.each do |i|
      if i == name
        position = @reindeer_ranking.index(i)
        @reindeer_ranking.push(i)
        @reindeer_ranking.delete_at(position)
      end
    end
    p @reindeer_ranking
  end
end


#Driver Code

#Creates new instance of Santa
nicholas = Santa.new("female", "black", "brown", "portugeuse", 12)

#Prints catchprase
nicholas.speak

#Expresses his love of a cookie
nicholas.eat_milk_and_cookies("chocolate chip")

nicholas.get_mad_at("Vixen")

p nicholas.gender = "unsure"

p nicholas.age
p nicholas.ethnicity

def santa_maker
  example_genders = ["agender", "female", "bigender", "male", 
                     "female", "gender fluid", "N/A"]
  example_ethnicities = ["black", "Latino", "white", "Japanese-African", 
                         "prefer not to say", "Mystical Creature (unicorn)", "N/A"] 
  sample_age = Random.new.rand(0..140)
  100.times do |x|
    santa = Santa.new(example_genders.sample, example_ethnicities.sample, "white", "english", sample_age)
    p santa
  end
end

santa_maker
