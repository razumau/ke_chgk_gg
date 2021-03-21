class Editor < ApplicationRecord
  self.table_name = 'editor'

  has_many :editor_details, class_name: "EditorDetails"
end
