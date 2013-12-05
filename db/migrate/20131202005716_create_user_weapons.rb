class CreateUserWeapons < ActiveRecord::Migration
  def change
    create_table :user_weapons do |t|
      t.belongs_to :user
      t.string :name
      t.text :description
      t.integer :power
      t.integer :power_bonus
      t.integer :luck
      t.integer :order

      t.timestamps
    end
    add_index :user_weapons, :user_id
  end
end
