class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :effect
      t.string :negative
      t.string :positive

      t.timestamps
    end
  end
end
