class GamesController < ApplicationController

  # Make this the default game where the game is.
  def index
    if user_signed_in?
      if current_user.game.nil?
        #if current user is signed in and they don't have a game send then to the new game method.
        redirect_to new_game_path
      else
        #if current user is signed in and they have a game redirect them to the show? page.
        # redirect_to game_path
        @game = User.find(current_user.id).game
        # @user = @game.user
        # @logs = @game.user_events
        # render action: "show"
        redirect_to game_path(@game.id)
      end
    else
      #if current user is not signed in send them to the home page? or sign up / log in page.
      redirect_to new_user_registration_path
    end
  end

  # This will be the profile page that anyone can see.
  def show
    @game = User.find(current_user.id).game
    @user = @game.user
    @logs = @game.user_events
  end

  #If the User has no game then the new action will be called.
  def new
    @game = current_user.game.new
  end

  # I'm not sure if I need an edit. I think I just need an update to update the points and gold and stuff?
  def edit
    @game = Game.find(params[:id])
  end

  #used when the new game action is called. 
  def create
    @game = current_user.game.new(params[:game])
    if @game.save
      redirect_to @game, notice: 'Your Game was successfully created.'
    else
      render action: "new"
    end
  end

  # updates the gold and stuff?
  def update 
    @game = User.find(current_user.id).game
    # if 
    # @game.update_attributes(params[:game])
    redirect_to @game, notice: 'Game was successfully updated.'
    # else 
    #   render action: "edit" 
    # end 
  end 

  # so an admin can destroy a users game.
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_url
  end
end
