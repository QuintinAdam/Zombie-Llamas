class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.belongs_to :game
      t.text :decription
      t.string :negative
      t.string :positive
      t.string :effect

      t.timestamps
    end
    add_index :user_events, :game_id
  end
end
