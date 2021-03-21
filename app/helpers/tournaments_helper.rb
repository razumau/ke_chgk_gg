module TournamentsHelper
  def display_chgk_editors(editors)
    grouped_by_editor = collect_all_by_editor_group(editors)
    if grouped_by_editor.length == 1
      return grouped_by_editor.keys.first
    end
    grouped_by_editor.map do |editor_group, tours|
      list_tours_in_parentheses(editor_group, tours)
    end.join(", ").concat(".")
  end

  def sort_by_last_name(names)
    names.sort_by { |name| name.split.last }
  end

  def join_names(names)
    without_last = names[0...-1].join(", ")
    [without_last, names.last].reject(&:blank?).join(" и ")
  end

  def group_by_stage(editors)
    tours = Hash.new { |hash, key| hash[key] = [] }
    editors.each do |editor|
      tours[editor.stage] << editor.name
    end
    tours
  end

  def collect_all_by_editor_group(editors)
    grouped = group_by_stage(editors)
    inverted = Hash.new { |hash, key| hash[key] = [] }
    grouped.each do |stage, names|
      sorted = sort_by_last_name(names)
      joined = join_names(sorted)
      inverted[joined] << stage
    end
    inverted
  end

  def list_tours_in_parentheses(editors, tours)
    text_in_parens = if tours.length == 1
                       "#{tours.first}-й тур"
                     else
                       "туры #{tours.join(", ")}"
                     end
    "#{editors} (#{text_in_parens})"
  end
end
