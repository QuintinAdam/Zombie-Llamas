class Game < ActiveRecord::Base
  belongs_to :user
  has_many :supplies
  
  attr_accessible :gold, :points, :population
end
