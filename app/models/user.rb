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

  def self.supply_math(sup_hash, game_id)
    random = Random.new 
    game = Game.find(game_id) 
    user = User.find(game.user_id)
    luck = random.rand(0..user.total_luck)
    dluck = luck % 10.0 
    users_power = (user.total_power * dluck) + user.total_power 
    users_defense = (user.total_defense * dluck) + user.total_defense
    users_order = (user.total_order * dluck) + user.total_order
    # have order effect the success chance!
    add_supdef_and_userpower = sup_hash[:defense] + users_power
    weaken_chance = random.rand(0..add_supdef_and_userpower)
    case weaken_chance
    when 0..users_power
      #makes it easier. 
      event = {name: sup_hash[:name], description: "You found a #{sup_hash[:description]} amount of supplies with no problems",
                 effect: "meh", negative: nil, positive: nil, 
                 effected_gold: nil, effected_points: nil, effected_population: nil
                }
      Game.run(event, game_id) 
      supply_power = (sup_hash[:power] / (random.rand(1.1..2)))          
    when (users_power + 1)..add_supdef_and_userpower
      #stays the same.
      event = {name: sup_hash[:name], description: "A member of your team got injured on the supply run. You found a #{sup_hash[:description]} amount of supplies and will make your way back to camp",
                 effect: "meh", negative: nil, positive: nil, 
                 effected_gold: nil, effected_points: nil, effected_population: nil
                }
      Game.run(event, game_id)
      supply_power = sup_hash[:power]           
    end
    add_userdef_and_suppower = users_defense + supply_power  
    success_chance = random.rand(0..add_userdef_and_suppower)
    case success_chance
    when 0..users_defense
      # user is successful
      event = {name: sup_hash[:name], description: "Your #{sup_hash[:description]} supply run was successful",
                 effect: "good", negative: nil, positive: sup_hash[:positive], 
                 effected_gold: sup_hash[:effected_gold], effected_points: sup_hash[:effected_points], effected_population: nil
                }
      Game.run(event, game_id)
    when (users_defense + 1)..add_userdef_and_suppower
      # user failed
      updated_gold = sup_hash[:effected_gold] / (random.rand(2..8))
      updated_points = sup_hash[:effected_points] / (random.rand(2..8))
      event = {name: sup_hash[:name], description: "Your #{sup_hash[:description]} supply run ended badly when a zombie attack one of your people. You lost some of your supplies",
                 effect: "bad", negative: sup_hash[:negative], positive: "#{updated_gold} Gold and #{updated_points} Points", 
                 effected_gold: updated_gold, effected_points: updated_points, effected_population: sup_hash[:effected_population]
                }
      Game.run(event, game_id)
    end
  end 
  def self.colony_math
  end
  def self.zombie_math(zom_hash, game_id)
    random = Random.new 
    game = Game.find(game_id) 
    user = User.find(game.user_id) 
    # Does the zombie get through your defense? 
    luck = random.rand(0..user.total_luck)
    dluck = luck % 10.0 
    # finds if luck is on there side.
    users_power = (user.total_power * dluck) + user.total_power 
    users_defense = (user.total_defense * dluck) + user.total_defense
    users_order = (user.total_order * dluck) + user.total_order

    # If the zombies power is greater then the users def. then the zombie gets inside.
    # else the zombie has a hard time getting in and loses half its defense. 
    add_zompower_and_userdef = zom_hash[:power] + users_defense
    weaken_chance = random.rand(0..add_zompower_and_userdef) 
    case weaken_chance
    when 0..users_defense
      # zombie is having a hard time getting though your defense.
      event = {name: zom_hash[:name], description: "#{zom_hash[:name]} had a hard time getting through your defenses. It was weakened getting through..",
                 effect: "meh", negative: nil, positive: nil, 
                 effected_gold: nil, effected_points: nil, effected_population: nil
                }
      Game.run(event, game_id) 
      zombie_defense = (zom_hash[:defense] / (random.rand(1.1..2)))
    when (users_defense + 1)..add_zompower_and_userdef
      # zombie easily got through the def.
      event = {name: zom_hash[:name], description: "#{zom_hash[:name]} got through your defenses easily.",
                 effect: "bad", negative: nil, positive: nil, 
                 effected_gold: nil, effected_points: nil, effected_population: nil
              }
      Game.run(event, game_id)
      zombie_defense = zom_hash[:defense]
    end
    
    # with the zombie defense now saved we can see if the zombies dies or if a person dies.
    add_userpower_and_zomdef = users_power + zombie_defense
    kill_chance = random.rand(0..add_userpower_and_zomdef)
    case kill_chance  
    when 0..users_power  
      #user killed the zombie
      event = {name: zom_hash[:name], description: "You Killed #{zom_hash[:name]}",
               effect: "good", negative: nil, positive: zom_hash[:positive], 
               effected_gold: zom_hash[:effected_gold], effected_points: zom_hash[:effected_points], effected_population: nil
              }
      Game.run(event, game_id) 
    when (users_power + 1)..add_userpower_and_zomdef
      # You killed the zombie but it took one of your own with it. 
      event = {name: zom_hash[:name], description: "#{zom_hash[:name]} killed one of your people before you could kill it",
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
    Game.create(user_id: self.id, time_last_clicked: Time.now, location: "Huancayo")
    #give a weapon, starter base, no llama, set the weapon and base as current.
  end
  
end
