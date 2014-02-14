class CreateHistoryEntries < ActiveRecord::Migration
  def change
    create_table :history_entries do |t|
      t.references :scene
      t.references :game, index: true

      t.timestamps
    end
  end
end
