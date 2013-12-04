class Zombie < ActiveRecord::Base
# a zombie is a attacking force def and powder to kill it.
# a zombie has a name, description, power
      # bob = {name: "", description: "", 
      #        power: 0, defense: 0, 
      #        effected_gold: 0, effected_points: 0, effected_population: -1
      #       }
      # User.zombie_math(bob) 
#that is very basic the outcome will be picked in zombie_math
 
#send the zombie info to the user model to do the math.
  def self.zombie(name, game_id)
    case name
    when "bob" 
      bob = {name: "Bob", description: "Bob is a zombie.", 
             power: 100, defense: 100,
             negative: "-1 Population", positive: "1000 Gold and 1200 Points", 
             effected_gold: 1000, effected_points: 1200, effected_population: -1
            }
      User.zombie_math(bob, game_id)      
    when "steve"
      steve = {name: "Steve", description: "Steve is also a zombie", 
               power: 100, defense: 100,
               negative: "-1 Population", positive: "40 Gold and 1002 Points", 
               effected_gold: 40, effected_points: 1002, effected_population: -1
              }  
      User.zombie_math(steve, game_id)  
    end          
  end

end