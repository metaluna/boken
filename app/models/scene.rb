class Scene < ActiveRecord::Base
  belongs_to :story
  
  validates :description, presence: true
  validates :story_id, presence: true
end
