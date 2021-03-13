class TournamentTeamsController < ApplicationController
  def index
    @teams = TournamentTeam.all
  end

  def show
    @team = TournamentTeam.find(params[:id])
  end
end
