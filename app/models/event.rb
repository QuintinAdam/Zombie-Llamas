class Event < ActiveRecord::Base
  attr_accessible :name, :description, :effect, :positive, :negative, :effected_gold, :effected_points, :effected_population
  
  def self.return_random_event
    random = Random.new
    random_event = Event.find(random.rand(1..Event.count)) 
    
    #latter events will need to be picked by where the users location is or quest.
 
  end

end
