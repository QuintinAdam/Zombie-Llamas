class CreateUserBases < ActiveRecord::Migration
  def change
    create_table :user_bases do |t|
      t.belongs_to :user
      t.string :name
      t.text :decription
      t.integer :defence
      t.integer :defence_bonus
      t.integer :luck
      t.integer :order

      t.timestamps
    end
    add_index :user_bases, :user_id
  end
end
