class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.text :description
      t.references :story, index: true

      t.timestamps
    end
  end
end
