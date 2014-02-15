class AddCurrentSceneToGame < ActiveRecord::Migration
  def change
    add_column :games, :current_scene_id, :integer
  end
end
