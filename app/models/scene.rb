class Scene < ActiveRecord::Base
  belongs_to :story
  has_many :triggers
  
  validates :description, presence: true
  validates :story_id, presence: true
end

class ErrorScene < Scene
  def description
    "Command not found. Please try again."
  end
end