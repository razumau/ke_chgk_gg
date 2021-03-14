class PlayerPlace < ApplicationRecord
  self.table_name = 'player_places'


  def eq_place
    format_place(self[:eq_place])
  end

  def br_place
    format_place(self[:br_place])
  end

  def si_place
    format_place(self[:si_place])
  end

  private

  def format_place(place)
    Integer(place)
  rescue
    place
  end
end
