class AddGoldAndPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer
    add_column :users, :gold, :integer
    add_column :users, :population, :integer
  end
end
