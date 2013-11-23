class UserEvent < ActiveRecord::Base
  belongs_to :game
  attr_accessible :decription, :effect, :negative, :positive
end
