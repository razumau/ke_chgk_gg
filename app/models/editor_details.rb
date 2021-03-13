class EditorDetails < ApplicationRecord
  self.table_name = 'editor_details'

  belongs_to :editor
  belongs_to :tournament
end

