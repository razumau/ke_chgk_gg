class EditorDetails < ApplicationRecord
  self.table_name = 'editor_details'

  belongs_to :editor
  belongs_to :tournament

  scope :for_tournament, ->(tournament_id) { where(tournament_id: tournament_id)}
  scope :name_and_stage, -> { select(:name, :stage) }
  scope :chgk, -> { where(game: 'ЧГК') }
  scope :eq, -> { where(game: 'ЭК') }
  scope :br, -> { where(game: 'БР') }
  scope :si, -> { where(game: 'СИ') }
end
