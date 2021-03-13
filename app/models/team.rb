class Team < ApplicationRecord
  self.table_name = 'team'
  has_many :tournamentteams, class_name: "TournamentTeam"

  def rating_link
    "https://rating.chgk.info/team/#{base_rating_id}"
  end
end
