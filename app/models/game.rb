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
    result = Event.run(event_to_run)
  end
end
