class Event < ActiveRecord::Base
  # belongs_to :game
  attr_accessible :name, :description, :effect, :interaction
  #events will effect the user like increase and decrease the population/gold/points

  def self.return_random_event
    # needs an array of events that could happen here.
    # events will need to be picked at random.
    # need some way to make this organized. events will have a name description(of what happened) and how they will interact with the user.
    random = Random.new
    # random.rand(1..1) # ..100
    @random_event = Event.find(random.rand(1..1)) # (random)
    



    #latter events will need to be picked by where the users location is. 
  end

  def self.run(event_to_run)
    #Do the event
    # event_to_run.name
    event_to_run.description # in the logs i will be displaying like #username #(discription) event happened and you lost / gained #(interactions). 
    event_to_run.type #this will effect the style by adding a class to the logs
    split_interaction(event_to_run.interaction)
    #this will send the event to the log that will be user_log model 
    # but this should grab the event interaction and update the users attributes.

    # @random_event.
  end

  def split_interaction(split)
    positive = []
    negivtive = []
    other = []
    split.each do |x|
      if x include?("+")
        positive << x
      elsif include?("-")
        negivtive << x
      else
        other << x #not sure if i will need this in here. BUT it could be a good place to put items when i have them.
      end
    end

  end

end
