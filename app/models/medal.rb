class Medal < ApplicationRecord
  self.table_name = 'medals'

  def name
    "#{first_name} #{last_name}"
  end

  belongs_to :player
  # belongs_to :tournament
end


