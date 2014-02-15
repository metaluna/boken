class Command < ActiveRecord::Base
  belongs_to :game
  
  validates :text, presence: true
  validates :game_id, presence: true
end
