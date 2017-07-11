module Shout
  #def self.yell_angrily(words)
  #  words + "!!!" + " :( "
  #end

  #def self.yelling_happily(words)
  #  words + "!!!" " :) "
  #end
  
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words + "!!!" + " :) "
  end

end

class Child
  include Shout
end

class Actor
  include Shout
end

kid_A = Child.new
actor_1 = Actor.new

p kid_A.yell_angrily("Shoot")
p actor_1.yell_happily("Yay")
