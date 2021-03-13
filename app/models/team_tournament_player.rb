class TeamTournamentPlayer < ApplicationRecord
  self.table_name = 'team_tournament_player'
  belongs_to :player
  belongs_to :tournamentteam, class_name: "TournamentTeam", foreign_key: "team_tournament_id"

end

