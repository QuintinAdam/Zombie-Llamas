class User < ActiveRecord::Base
  has_one :game
  rolify
  after_create :init_setup
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :gold, :points, :population

  def init_setup
    self.update_attributes(:gold => 1500, :points => 110, :population => 2)
    Game.create(user_id: self.id, time_last_clicked: Time.now)
  end
  
end
