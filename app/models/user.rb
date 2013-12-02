class User < ActiveRecord::Base
  has_one :game
  has_many :user_bases
  has_many :user_weapons
  has_many :user_llamas

  rolify
  after_create :init_setup

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, 
                  :gold, :points, :population, 
                  :total_power, :total_defense, :total_luck, :total_order 


  @user = User.find(current_user.id)  
  @random = Random.new             
  def zombie_math(zom_hash)
    #does the zombie get through your defense?
    luck = @random.rand(0..@user.total_luck)
    dluck = luck % 10.0
    users_power = (@user.total_power * dluck) + @user.total_power
    users_defense = (@user.total_defense * dluck) + @user.total_defense
    users_order = (@user.total_order * dluck) + @user.total_order
    if zom_hash[:power] >= users_defense
      # zombie got through your defenses. 
      if zom_hash[:defence] >= users_power
        # You did not kill the zombie 
      else
        # You got through the zombies defense
      end
    else
      # zombie is having a hard time getting though your defense.
      added = users_defense + zom_hash[:power]
      chance = @random.rand(1..added)
      case chance
      when 1..zom_hash[:power]
        #zombie got though the defense
      when (zom_hash[:power] + 1)..added
        #zombie left
    end
  end

  private

  def init_setup
    self.update_attributes(:gold => 1500, :points => 110, :population => 2)
    self.add_role :user
    Game.create(user_id: self.id, time_last_clicked: Time.now)
    #give a weapon, starter base, no llama, set the weapon and base as current.
  end
  
end
