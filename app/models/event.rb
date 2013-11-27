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

  # def self.split_interaction(events)
  #   # puts "events = #{events}" 
  #   positive_array = []
  #   # puts "positive_array = #{ positive_array}"
  #   negative_array = []
  #   # puts "negative_array = #{negative_array}"
  #     split_event = events.split(', ')
  #     split_events.each do |x|
  #       if x.include?("+")
  #         # puts "#{x} was included in the positive array"
  #         positive_array << x
  #       elsif x.include?("-")
  #         # puts "#{x} was included in the negative array"
  #         negative_array << x
  #       end
  #     end 
  #   positive_and_negative = []
  #   positive_and_negative << positive_array
  #   positive_and_negative << negative_array
  #   positive_and_negative
  # end

  def self.run(event_to_run)
    positive_array = []
    negative_array = []
    split_event = event_to_run.interaction.split
    split_events.each do |x|
      if x.include?("+")
        positive_array << x
      elsif x.include?("-")
        negative_array << x
      end
    end
    #Do the event and update it to the user_event_log
    # positive_and_negative = Event.split_interaction(event_to_run.interaction)
    u = UserEvent.create(:description => event_to_run.description,
                         :effect => event_to_run.effect,
                         :negative => negative_array, 
                         :positive => positive_array, 
                         :game_id => User.find(current_user.id)
                        )

    # event_to_run.description # in the logs i will be displaying like #username #(discription) event happened and you lost / gained #(interactions). 
    # event_to_run.effect #this will effect the style by adding a class to the logs
    
    #this will send the event to the log that will be user_log model 
    # but this should grab the event interaction and update the users attributes.

    # @random_event.
  end

 

end
