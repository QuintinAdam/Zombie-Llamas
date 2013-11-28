class Game < ActiveRecord::Base
  belongs_to :user
  has_many :user_events
  attr_accessible :user_id, :time_last_clicked
  before_update :run_event
  #validate :number_of_events, :on => :create

  #def number_of_events
    # self.user.user_events.first.destroy if self.user.user_events.count() >= 10
  #end

  def can_run_event?
    Time.now - time_last_clicked > 60 
  end

  def run_event
    return false unless can_run_event?
    event_to_run = Event.return_random_event
    result = run(event_to_run)
  end

  def run(event_to_run)
    positive_array = []
    negative_array = []
    split_events = event_to_run.interaction.split
    split_events.each do |x|
      if x.include?("+")
        positive_array << x
      elsif x.include?("-")
        negative_array << x
      end
    end
    #Do the event and update it to the user_event_log
    # positive_and_negative = Event.split_interaction(event_to_run.interaction)
    u = UserEvent.create(:name => event_to_run.name,
                         :description => event_to_run.description,
                         :effect => event_to_run.effect
                         # :negative => negative_array, 
                         # :positive => positive_array 
                         # :game_id => User.find(current_user.id).game.id
                        )
  end

end
 