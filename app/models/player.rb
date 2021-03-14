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

  def results
    places = fetch_places
    tournamentteams.map do |team|
      this_tournament_places = places[team.tournament_id]
      PlayerResults.new(
                        team: team,
                        year: TournamentYear.year(team.tournament_id),
                        chgk: this_tournament_places.chgk_place,
                        eq: this_tournament_places.eq_place,
                        br: this_tournament_places.br_place,
                        si: this_tournament_places.si_place
                        )
    end
  end

  def fetch_places
    playerplaces.each_with_object({}) do |pp, hash|
      hash[pp.tournament_id] = pp
    end
  end
end

