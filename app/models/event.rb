class Event < ActiveRecord::Base
  #inside each location you have an event_(location) array that has the type of events
  #then it picks 1 type_of_event and calls that method.
  # from there it will pick a event in that type of event and go to that model.
  #, "colony_event", "llama_event", "zom_lam_event" , "supply_event"
  random = Random.new 
  def self.hauncayo(game_id)
    event_hauncayo = ["zombie_event"]
    type_of_event = event_hauncayo[random.rand(0...(event_hauncayo.count))]
    def self.zombie_event(game_id)
      type_of_zombie = random.rand(1..100)
      # with that random number it will call a zombie in the zombie model
      case type_of_zombie
      when 1..50 then Zombie.zombie("bob", game_id)
      when 51..100 then Zombie.zombie("steve", game_id)
      end
    end

    def self.colony_event
      type_of_colony_event = random.rand(1..100)
      # a colony event is an event that happens inside of the base.
      case type_of_colony_event
      when 1..50 then Colony.colony("type", game_id)
      when 51..100 then Colony.colony("type2", game_id)
      end
    end

    def self.supply_event(game_id)
      type_of_supply_event = random.rand(1..100)
      # a supplies event that happens on the outside of the colony
      case type_of_supply_event
      when 1..60 then Supply.supply("small", game_id)
      when 61..90 then Supply.supply("med", game_id)
      when 91..100 then Supply.supply("large", game_id)
      end
    end

    def self.llama_event(game_id)
      # A llama event is where the users llama has an effect.
      # find what llama the user is using
      # if nil?
      # pass the name of the llama to the llama model. 

    end

    def self.zom_lam_event(game_id)
      type_of_zom_lam_event = random.rand(1..100)
      # zombie llama event is where a zombie llama attacks.

    end

    case type_of_event
    when "zombie_event" then zombie_event(game_id)
    when "colony_event" then colony_event(game_id)
    when "supply_event" then supply_event(game_id)
    when "llamas_event" then llama_event(game_id)
    when "zom_lam_event" then zom_lam_event(game_id)
    end
  end

  def self.random_event(game_id)
    game = Game.find(game_id)
    location = game.location

    if location.nil?
      location = "Hauncayo"
    end

    case location
    when "Hauncayo" then hauncayo(game_id)
    # when "Huancavelica" then huancavelica(game_id)
    # when "Ayacucho" then ayacucho(game_id)
    # when "Audahaylas" then audahaylas(game_id)
    # when "Abancay" then abancay(game_id)
    # when "Cusco" then cusco(game_id)
    # when "Urcos" then urcos(game_id)
    # when "Combapata" then combapata(game_id)
    # when "San Pablo" then san_pablo(game_id)
    # when "Ayaviri" then ayaviri(game_id)
    # when "Azangaro" then azangaro(game_id)
    # when "Puno" then puno(game_id)
    # when "Juliaca" then juliaca(game_id)
    # when "Santa Lucia" then santa_lucia(game_id)
    # when "Arequipa" then arequipa(game_id)
    # when "Mollendo" then mollendo(game_id)
    # when "san Juan de Marcona" then san_juan(game_id)
    # when "Nazca" then nazca(game_id)
    # when "Ica" then ica(game_id)
    # when "Pisco" then pisco(game_id)
    # when "San Vicente de Canete" then san_vicente(game_id)
    # when "Punta Hermosa" then punta_hermosa(game_id)
    # when "Lima" then lima(game_id)  
    end
  end
end