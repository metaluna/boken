class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.string :text
      t.references :scene, index: true
      t.references :target, index: true

      t.timestamps
    end
  end
end
