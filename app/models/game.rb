class Game < ActiveRecord::Base
  belongs_to  :story
  belongs_to  :user
  has_many    :history_entries, -> { order "created_at ASC" }
  has_many    :commands, -> { order "created_at ASC" }
  belongs_to  :current_scene, class_name: "Scene"
  
  validates :story_id, presence: true

  before_create { self.current_scene = self.story.scenes.first }
  after_create  { self.history_entries.create(scene: self.current_scene) }
  
  def execute(command)
    command = command.text if command.is_a? Command
    
    current_scene.triggers.each do |t|
      if t.text == command
        scene = t.target
        current_scene = scene
        history_entries.create(scene: scene)      
        return scene
      end
    end
    
    ErrorScene.new
  end
  
end
