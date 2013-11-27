def new
    @game = current_user.game.new
end