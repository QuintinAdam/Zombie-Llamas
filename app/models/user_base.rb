class UserBase < ActiveRecord::Base
  belongs_to :user
  attr_accessible :decription, :defence, :defence_bonus, :luck, :name, :order
  def display
    # Don't no why i thought i would need that. or if i need this.
  end
end
