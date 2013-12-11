class UserWeaponsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @weapons = @user.user_weapons.all
  end

  def show

  end

  def use

  end

  def create

  end
end