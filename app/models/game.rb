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

  def run_event(g_id)
    return false unless can_run_event?
    event_to_run = Event.return_random_event
    run(event_to_run, g_id)
  end

  def run(event_to_run, game_id)
    # raise Game
    u = UserEvent.create(:name => event_to_run.name,
                         :description => event_to_run.description,
                         :effect => event_to_run.effect,
                         :negative => event_to_run.negative, 
                         :positive => event_to_run.positive,
                         :game_id => game_id
                        )
    game = Game.find(game_id)
    user = User.find(game.user_id)
    game.update_attributes(time_last_clicked: Time.now)
    #needs to update the user based on the event
    user.update_attributes(:gold => 1500, :points => 110, :population => 2)
    

    #change all this.
  end

end
 