class RemoveGoldAndPointsFromGame < ActiveRecord::Migration
  def up
    remove_column :games, :points
    remove_column :games, :gold
    remove_column :games, :population
  end

  def down
    add_column :games, :points, :integer
    add_column :games, :gold, :integer
    add_column :games, :population, :integer
  end
end
