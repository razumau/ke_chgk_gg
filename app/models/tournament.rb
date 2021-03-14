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

    reversed.sort_by(&:last)
  end

  def eq_editors
    editors = EditorDetails.where(tournament_id: id, game: 'ЭК')
                           .select(:name, :stage)

  end

  def br_editors
    editors = EditorDetails.where(tournament_id: id, game: 'БР')
                           .select(:name, :stage)
  end

  def si_editors
    editors = EditorDetails.where(tournament_id: id, game: 'СИ')
                           .select(:name, :stage)
  end

  private

  def group_editors

  end
end
