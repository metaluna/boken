class Game < ActiveRecord::Base
  belongs_to :story
  has_many :history_entries, -> { order "created_at ASC" }
  has_many :commands, -> { order "created_at ASC" }
  
  validates :story_id, presence: true
  
  after_create do |game|
    game.history_entries.create(scene: game.story.scenes.first)
  end
end
