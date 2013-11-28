class UserEvent < ActiveRecord::Base
  belongs_to :game
  attr_accessible :description, :effect, :negative, :positive, :game_id, :name
  def display
    
  end
end
