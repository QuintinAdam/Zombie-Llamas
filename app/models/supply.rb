class Supply < ActiveRecord::Base
  # bob = {name: "Bob", description: "Bob is a zombie.", 
  #        power: 100, defense: 100,
  #        negative: "-1 Population", positive: "1000 Gold and 1200 Points", 
  #        effected_gold: 1000, effected_points: 1200, effected_population: -1
  #       }

  def self.supply(name, game_id)
    case name
    when "small" 
      # bob = {name: "Bob", description: "Bob is a zombie.", 
      #        power: 100, defense: 100,
      #        negative: "-1 Population", positive: "1000 Gold and 1200 Points", 
      #        effected_gold: 1000, effected_points: 1200, effected_population: -1
      #       } 
      # User.zombie_math(bob, game_id)     
    when "med" then
      # bob = {name: "Bob", description: "Bob is a zombie.", 
      #        power: 100, defense: 100,
      #        negative: "-1 Population", positive: "1000 Gold and 1200 Points", 
      #        effected_gold: 1000, effected_points: 1200, effected_population: -1
      #       }  
      # User.zombie_math(bob, game_id)    
    end
    when "large" then
      # bob = {name: "Bob", description: "Bob is a zombie.", 
      #        power: 100, defense: 100,
      #        negative: "-1 Population", positive: "1000 Gold and 1200 Points", 
      #        effected_gold: 1000, effected_points: 1200, effected_population: -1
      #       }  
      # User.zombie_math(bob, game_id)    
    end    
  end

end
