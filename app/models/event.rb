class Event < ActiveRecord::Base
  belongs_to :game
  # attr_accessible :title, :body
  #events will effect the user like increase and decrease the population/gold/points
  def self.return_random_event
    # needs an array of events that could happen here.
    # events will need to be picked at random.
    # need some way to make this organized. events will have a name description(of what happened) and how they will interact with the user.
    random = Random.new
    random.rand(1..100) 
    random_even = Event.find(random.to_i)
    



    #latter events will need to be picked by where the users location is. 
  end

  def run
    #Do the event
  end
end
