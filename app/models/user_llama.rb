class UserLlama < ActiveRecord::Base
  belongs_to :user
  attr_accessible :decription, :defence, :defence_bonus, :luck, :name, :order, :power, :power_bonus
  def display
    # Don't no why i thought i would need that. or if i need this.
  end
end
