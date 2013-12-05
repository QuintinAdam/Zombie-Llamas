class Game < ActiveRecord::Base
  belongs_to :user
  has_many :user_events
  attr_accessible :user_id, :time_last_clicked, :location, :current_weapon, :current_base, :current_llama 
  after_save :number_of_events
  #fix this
  def number_of_events
    #self.user_events.last.destroy if self.user_events.count() > 10
  end
 
  def can_run_event?
    Time.now - time_last_clicked > 10 
  end

  def run_event(game_id)
    if can_run_event?
      true
    else
      false
    end
  end

  def self.run(event_returned, game_id)
    # raise Game
    UserEvent.create(:name => event_returned[:name],
                     :description => event_returned[:description],
                     :effect => event_returned[:effect],
                     :negative => event_returned[:negative], 
                     :positive => event_returned[:positive],
                     :game_id => game_id
                    )
    game = Game.find(game_id)
    user = User.find(game.user_id)
    game.update_attributes(time_last_clicked: Time.now)
    # update the user based on the event
    unless event_returned[:effected_gold].nil?
      user.gold += event_returned[:effected_gold]
    end
    unless event_returned[:effected_points].nil?
      user.points += event_returned[:effected_points]
    end
    unless event_returned[:effected_population].nil?
      user.population += event_returned[:effected_population]
    end
    user.save
  end

end
 