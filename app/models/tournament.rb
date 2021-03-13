class Tournament < ApplicationRecord
  self.table_name = 'tournament'

  has_many :tournamentteams, class_name: "TournamentTeam"
  has_many :editor_details, class_name: "EditorDetails"

  def chgk_editors
    editors = EditorDetails.where(tournament_id: id, game: 'ЧГК')
                           .order(:name)
                           .select(:name, :tour)

    tours = Hash.new { |hash, key| hash[key] = [] }
    editors.each do |editor|
      tours[editor.tour] << editor.name
    end

    reversed = Hash.new { |hash, key| hash[key] = [] }
    tours.each do |tour, names|
      joined = names.join(", ")
      reversed[joined] << tour
    end

    reversed
  end
end
