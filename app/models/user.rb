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
 

  def self.zombie_math(zom_hash, game_id)
    random = Random.new 
    game = Game.find(game_id)
    user = User.find(game.user_id)
    #does the zombie get through your defense?
    luck = random.rand(0..user.total_luck)
    dluck = luck % 10.0
    # finds if luck is on there side.
    users_power = (user.total_power * dluck) + user.total_power
    users_defense = (user.total_defense * dluck) + user.total_defense
    users_order = (user.total_order * dluck) + user.total_order

    #If the zombies power is greater then the users def. then the zombie gets inside.
    #else the zombie has a hard time getting in and loses half its defense. 
    if zom_hash[:power] >= users_defense
      # zombie easily got through the def.
      event = {name: zom_hash[:name], description: "#{zom_hash[:name]} got through your defenses easily.",
                 effect: "bad", negative: nil, positive: nil, 
                 effected_gold: nil, effected_points: nil, effected_population: nil
              }
      Game.run(event, game_id)
      zombie_defense = zom_hash[:defense]
    else
      # zombie is having a hard time getting though your defense.
      event = {name: zom_hash[:name], description: "#{zom_hash[:name]} had a hard time getting through your defenses. It was weakened getting through..",
                 effect: "meh", negative: nil, positive: nil, 
                 effected_gold: nil, effected_points: nil, effected_population: nil
                }
      Game.run(event, game_id) 
      zombie_defense = (zom_hash[:defense] / 2 )
    end
    # with the zombie defense now saved we can see if the zombies dies or if a person dies.
    added = users_power + zombie_defense
    chance = random.rand(0..added)
    case chance  
    when 0..users_power  
      #user killed the zombie
      event = {name: zom_hash[:name], description: "You Killed #{zom_hash[:name]}",
               effect: "good", negative: nil, positive: zom_hash[:positive], 
               effected_gold: zom_hash[:effected_gold], effected_points: zom_hash[:effected_points], effected_population: nil
              }
      Game.run(event, game_id) 
    when (users_power + 1)..added
      # You killed the zombie but it took one of your own with it. 
      event = {name: zom_hash[:name], description: "#{zom_hash[:name]} be killing your people.",
               effect: "bad", negative: zom_hash[:negative], positive: zom_hash[:positive], 
               effected_gold: nil, effected_points: nil, effected_population: (user.population >= 3 ? zom_hash[:effected_population] : nil )
              }
      Game.run(event, game_id)
    end       
  end

  private

  def init_setup
    self.update_attributes(:gold => 1500, :points => 110, :population => 12, :total_power => 10, :total_defense => 10, :total_luck => 10, :total_order => 10 )
    self.add_role :user
    Game.create(user_id: self.id, time_last_clicked: Time.now)
    #set the users location
    #give a weapon, starter base, no llama, set the weapon and base as current.
  end
  
end
