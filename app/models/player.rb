class Player < ApplicationRecord
  self.table_name = 'player'

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def rating_link
    "https://rating.chgk.info/player/#{self.rating_id}"
  end
end
