class Game < ActiveRecord::Base
  belongs_to :user
  attr_accessible :gold, :points, :population
end
