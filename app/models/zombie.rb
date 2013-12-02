class Zombie < ActiveRecord::Base
# a zombie is a attacking force def and powder to kill it.
# a zombie has a name, description, power
      # bob = {name: "", description: "", 
      #        power: 0, defense: 0, 
      #        gold: 0, points: 0, population: -1
      #       }
      # User.zombie_math(bob)
#that is very basic the outcome will be picked in zombie_math

#send the zombie info to the user model to do the math.
  def zombie_event(name)
    case name
    when "bob" 
      bob = {name: "Bob", description: "Bob is a zombie.", 
             power: 0, defense: 0, 
             gold: 0, points: 0, population: -1
            }
      User.zombie_math(bob)      
    when "steve"
      steve = {name: "Steve", description: "Steve is also a zombie", 
               power: 0, defense: 0, 
               gold: 0, points: 0, population: -1
              }  
      User.zombie_math(steve)            
  end

end