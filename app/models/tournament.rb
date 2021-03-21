class Tournament < ApplicationRecord
  self.table_name = 'tournament'
  include TournamentEditors

  has_many :tournamentteams, class_name: "TournamentTeam"
  has_many :editor_details, class_name: "EditorDetails"

  def chgk_results
    ChgkResult.joins("LEFT OUTER JOIN team_tournament ON chgk_results.team_tournament_id = team_tournament.id")
              .where("tournament_id = ?", id)
              .select(:name, :sum, :tour_1, :tour_2, :tour_3, :tour_4, :tour_5)
              .order("sum DESC, shootout DESC")
  end

  def editors
    EditorDetails.for_tournament(id).name_and_stage
  end

  def chgk_editors
    editors.chgk
  end

  def eq_editors
    editors.eq
  end

  def br_editors
    editors.br
  end

  def si_editors
    editors.si
  end
end
