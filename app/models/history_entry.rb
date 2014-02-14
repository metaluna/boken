class HistoryEntry < ActiveRecord::Base
  belongs_to :scene
  belongs_to :game
  
  validates :scene_id, presence: true
  validates :game_id, presence: true
end
