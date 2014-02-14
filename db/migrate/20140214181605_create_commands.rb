class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string     :text
      t.references :game, index: true

      t.timestamps
    end
  end
end
