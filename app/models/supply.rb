class Supply < ActiveRecord::Base
  belongs_to :game
  attr_accessible :description, :game, :name, :type
end
