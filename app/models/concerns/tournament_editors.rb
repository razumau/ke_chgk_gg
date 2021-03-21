module TournamentEditors
  def chgk_editors
    editors = EditorDetails.chgk
                           .where(tournament_id: id)
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
    editors = EditorDetails.eq
                           .where(tournament_id: id)
                           .select(:name, :stage)
    group_editors(editors)
  end

  def br_editors
    editors = EditorDetails.br
                           .where(tournament_id: id)
                           .select(:name, :stage)
    group_editors(editors)
  end

  def si_editors
    editors = EditorDetails.si
                           .where(tournament_id: id)
                           .select(:name, :stage)
    group_editors(editors)
  end

  private

  def group_editors(editors)
    editors
  end
end