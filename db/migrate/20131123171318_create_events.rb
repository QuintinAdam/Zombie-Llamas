class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :game

      t.timestamps
    end
    add_index :events, :game_id
  end
end
