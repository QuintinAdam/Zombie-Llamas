class CreateUserLlamas < ActiveRecord::Migration
  def change
    create_table :user_llamas do |t|
      t.belongs_to :user
      t.string :name
      t.text :description
      t.integer :power
      t.integer :power_bonus
      t.integer :defense
      t.integer :defense_bonus
      t.integer :luck
      t.integer :order

      t.timestamps
    end
    add_index :user_llamas, :user_id
  end
end
