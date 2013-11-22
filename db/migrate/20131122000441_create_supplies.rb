class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.belongs_to :user
      t.string :name
      t.string :type
      t.text :description

      t.timestamps
    end
      add_index :supplies, :user_id
  end
end
