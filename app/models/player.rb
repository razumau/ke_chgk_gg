class Player < ApplicationRecord
  self.table_name = 'player'

  has_many :teamtournamentplayers, class_name: "TeamTournamentPlayer"
  has_many :tournamentteams, through: :teamtournamentplayers, class_name: "TournamentTeam"
  has_many :playerplaces, class_name: "PlayerPlace", foreign_key: "id"

  def name
    "#{first_name} #{last_name}"
  end

  def rating_link
    "https://rating.chgk.info/player/#{rating_id}"
  end

  def places
    playerplaces.map do |pp|
      TournamentYear.year(pp.tournament_id)
    end
  end
end
