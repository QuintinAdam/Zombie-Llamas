class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user
      t.datetime :time_last_clicked
      t.string :location

      t.timestamps
    end
    add_index :games, :user_id
  end
end
