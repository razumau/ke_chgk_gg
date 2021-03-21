class TournamentTeam < ApplicationRecord
  self.table_name = 'team_tournament'
  belongs_to :tournament
  belongs_to :team
  has_many :teamtournamentplayers, class_name: "TeamTournamentPlayer", foreign_key: "team_tournament_id"
  has_many :players, through: :teamtournamentplayers
  has_one :chgkresult, class_name: "ChgkResult", foreign_key: "team_tournament_id"

  def rating_link
    "https://rating.chgk.info/team/#{rating_id}"
  end
end
