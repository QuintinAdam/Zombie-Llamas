class Supply < ActiveRecord::Base
  # bob = {name: "Bob", description: "Bob is a zombie.", 
  #        power: 100, defense: 100,
  #        negative: "-1 Population", positive: "1000 Gold and 1200 Points", 
  #        effected_gold: 1000, effected_points: 1200, effected_population: -1
  #       }

  def self.supply(name, game_id)
    # Supply runs still have a power and defense based on how hard the supply run is.
    case name
    when "small" 
      # loot chance
      small = {name: "Small Supply Run", description: "small", 
             power: 1, defense: 1,
             negative: nil, positive: "1000 Gold and 1200 Points", 
             effected_gold: 1000, effected_points: 1200, effected_population: nil
            } 
      User.supply_math(small, game_id)     
    when "med"
      medium = {name: "Medium Supply Run", description: "medium", 
             power: 10, defense: 10,
             negative: "-1 Population", positive: "2000 Gold and 2200 Points", 
             effected_gold: 2000, effected_points: 2200, effected_population: -1
            }  
      User.supply_math(medium, game_id) 
    when "large"
      large = {name: "Large Supply Run", description: "large", 
             power: 100, defense: 100,
             negative: "-2 Population", positive: "6000 Gold and 4200 Points", 
             effected_gold: 6000, effected_points: 4200, effected_population: -2
            }  
      User.supply_math(large, game_id)    
    end  
  end

end
