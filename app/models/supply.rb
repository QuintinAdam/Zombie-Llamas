class Supply < ActiveRecord::Base
  #has_and_belongs_to_many :users
  attr_accessible :description, :user_id, :name, :type
end
