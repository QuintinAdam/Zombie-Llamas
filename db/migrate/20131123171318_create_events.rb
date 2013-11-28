class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :effect
      t.string :negative
      t.string :positive
      t.integer :effected_gold
      t.integer :effected_points
      t.integer :effected_population
      
      t.timestamps
    end
  end
end
