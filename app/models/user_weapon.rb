class UserWeapon < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :luck, :name, :order, :power, :power_bonus
  #need an index and a show page for wep n stuff.
  def display
    # Don't no why i thought i would need that. or if i need this.
  end
end
