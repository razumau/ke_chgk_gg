class Team < ApplicationRecord
  self.table_name = 'team'
  def rating_link
    "https://rating.chgk.info/team/#{self.base_rating_id}"
  end
end
