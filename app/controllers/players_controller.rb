class PlayersController < ApplicationController
  def index
    @players = Player.all.order("last_name")
  end

  def show
    @player = Player.find(params[:id])
  end
end
