class TournamentTeam < ApplicationRecord
  self.table_name = 'team_tournament'
  belongs_to :tournament
  belongs_to :team
  has_many :teamtournamentplayers, class_name: "TeamTournamentPlayer", foreign_key: "team_tournament_id"
  has_many :players, through: :teamtournamentplayers

  def rating_link
    "https://rating.chgk.info/team/#{rating_id}"
  end
end
