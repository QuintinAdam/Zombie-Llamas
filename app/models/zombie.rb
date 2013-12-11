class Zombie < ActiveRecord::Base
# a zombie is a attacking force def and powder to kill it.
# a zombie has a name, description, power, defense, and what it effects.
      # bob = {name: "", description: "", 
      #        power: 0, defense: 0, 
      #        effected_gold: 0, effected_points: 0, effected_population: -1
      #       }
      # User.zombie_math(bob) 
#send the zombie info to the user model to do the math. 
  def self.zombie(name, game_id)
    case name
    when "bob" 
      # hauncayo, Weak zombie
      bob = {name: "Bob", description: "Bob is a zombie.", 
             power: 5, defense: 10,
             negative: "-1 Population", positive: "1000 Gold and 1200 Points", 
             effected_gold: 1000, effected_points: 1200, effected_population: -1
            }
      User.zombie_math(bob, game_id)      
    when "steve"
      # Hauncayo, stronger zombie
      steve = {name: "Steve", description: "Steve is also a zombie", 
               power: 40, defense: 40,
               negative: "-1 Population", positive: "40 Gold and 1002 Points", 
               effected_gold: 40, effected_points: 1002, effected_population: -1
              }  
      User.zombie_math(steve, game_id)  
    end          
  end
end