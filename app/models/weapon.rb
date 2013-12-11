class Weapon < ActiveRecord::Base
# name, description, power, power_bonus, luck, :order
# ex: knife = {name: "Knife", description: "A weak weapon", power: 10, power_bonus: 0, luck: 2, order: -10}
# integer 
  def give_weapon_to_user(weapon, game_id)
    UserWeapon.create(:name => weapon[:name], 
                      :description => weapon[:description], 
                      :power => weapon[:power])
  end

  def weapon(name, game_id)
    case name
    when "knife"
      knife = {name: "Knife", description: "A weak weapon", 
              power: 10, power_bonus: 0, luck: 2, order: -10
            }
      give_weapon_to_user(knife, game_id)        
    when "other" 
      # knife = {name: "Knife", description: "A weak weapon", 
      #         power: 10, power_bonus: 0, luck: 2, order: -10}          
    end 
  end
end

# displays all of the possible weapons but disable them if the user dose not have the item.