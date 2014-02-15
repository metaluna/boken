class Trigger < ActiveRecord::Base
  belongs_to :scene
  belongs_to :target, class_name: "Scene"
  
  validates :text, presence: true
  validates :scene_id, presence: true
  validates :target_id, presence: true
end
