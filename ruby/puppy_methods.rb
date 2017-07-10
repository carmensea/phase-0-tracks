require 'pry'

class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
  end

  def speak(number)
    number.times { puts "Woof" }
  end

  def roll_over
    puts "*roll over*"
  end

  def dog_years(number)
    puts number * 7
  end

  def shake
    puts "*shake*"
  end

  def initialize 
    puts "Initializing new puppy instance ..."
  end
end

#dog = Puppy.new
#p dog.fetch("ball")

#p dog.speak(5)

#p dog.roll_over

#p dog.dog_years(5)

#p dog.shake


class Car

 def initialize
    p "creating a car"
 end

 def model(name)
   p "Our car is a #{name}!"
 end

 def color(shade)
   p "The color is #{shade}."
 end

end


def make_cars
  car_array = []
  first_car = 0
  while first_car < 51
    suv = Car.new
    car_array << suv 
    first_car += 1
  end
  car_array.each do |car_number|
    p car_number.model("Toyota")
    p car_number.color("red")
  end
end

make_cars
#car = Car.new
#
#p car.model("Toyota")
#
#p car.color("red")




