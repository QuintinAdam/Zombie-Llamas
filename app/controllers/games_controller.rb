class GamesController < ApplicationController

  # Make this the default game where the game is.
  def index
    @games = Game.all
    
  end

  # This will be the profile page that anyone can see.
  def show
    @game = Game.find(params[:id])
  end

  #If the User has no game then the new action will be called.
  def new
    @game = Game.new
  end

  # I'm not sure if I need an edit. I think I just need an update to update the points and gold and stuff?
  def edit
    @game = Game.find(params[:id])
  end

  #used when the new game action is called. 
  def create
    @game = Game.new(params[:game])
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render action: "new"
    end
  end

  # updates the gold and stuff?
  def update 
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect_to @game, notice: 'Game was successfully updated.'
    else 
      render action: "edit" 
    end 
  end 

  # so an admin can destroy a users game.
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_url
  end
end
