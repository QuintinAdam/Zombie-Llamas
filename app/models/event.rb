class Event < ActiveRecord::Base
  # attr_accessible :name, :description, :effect, :positive, :negative, :effected_gold, :effected_points, :effected_population
  # #not a active record. 
  # def self.return_random_event
  #   random = Random.new
  #   random_event = Event.find(random.rand(1..Event.count))  
  # end
  #find the users location
  @random = Random.new 
  #inside each location you have an event_(location) array that has the type of events
  #then it picks 1 type_of_event and calls that method.
  # from there it will pick a event in that type of event and go to that model.
  #, "colony_event", "villager_event", "llamas_event", "zom_lam_event"
  def self.hauncayo(game_id)
    event_hauncayo = ["zombie_event"]
    type_of_event = event_hauncayo[@random.rand(0...(event_hauncayo.count))]
    def self.zombie_event(game_id)
      type_of_zombie = @random.rand(1..100)
      # with that random number it will call a zombie in the zombie model
      case type_of_zombie
      when 1..50 then Zombie.zombie("bob", game_id)
      when 51..100 then Zombie.zombie("steve", game_id)
      else
        return false
      end
    end

    # def colony_event
    #   type_of_colony_event = @random.rand(1..100)
    #   case type_of_colony_event
    #   when 1..50 then return "hi"
    #   when 51..100 then return "hi"
    #   end
    # end

    # def villager_event
      
    # end
      
    case type_of_event
    when "zombie_event" then zombie_event(game_id)
    # when "colony_event" then colony_event
    # when "villager_event" then villager_event
    # when "llamas_event" then llamas_event
    # when "zom_lam_event" then zom_lam_event
    else
      puts "it be broken."
    end
  end

  def self.random_event(game_id)
    game = Game.find(game_id)
    # @random = @random.new
    # Make this a switch statement
    location = game.location

    if location.nil?
      location = "hauncayo"
    end

    case location
    when "hauncayo" then hauncayo(game_id)
    end
 
  end

end
