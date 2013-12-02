class UserEvent < ActiveRecord::Base
  belongs_to :game
  attr_accessible :description, :effect, :negative, :positive, :game_id, :name
  def display
    # Don't no why i thought i would need that. or if i need this.
  end
end
