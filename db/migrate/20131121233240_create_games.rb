class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user
      t.integer :points
      t.integer :gold
      t.integer :population

      t.timestamps
    end
    add_index :games, :user_id
  end
end
