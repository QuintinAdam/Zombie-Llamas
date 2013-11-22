class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.belongs_to :game
      t.string :name
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
