class Game < ActiveRecord::Base
  belongs_to :user
  has_many :user_events
  attr_accessible :user_id, :time_last_clicked, :location, :current_weapon, :current_base, :current_llama 
  after_save :number_of_events
  #fix this
  def number_of_events
    self.user_events.first.destroy if self.user_events.count() > 10
  end

  def can_run_event?
    Time.now - time_last_clicked > 10 
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
    # update the user based on the event
    unless event_to_run.effected_gold.nil?
      user.gold += event_to_run.effected_gold
    end
    unless event_to_run.effected_points.nil?
      user.points += event_to_run.effected_points
    end
    unless event_to_run.effected_population.nil?
      user.population += event_to_run.effected_population
    end
    user.save
  end

end
 