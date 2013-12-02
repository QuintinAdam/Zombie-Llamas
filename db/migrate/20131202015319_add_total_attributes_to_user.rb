class AddTotalAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_power, :integer
    add_column :users, :total_defense, :integer
    add_column :users, :total_luck, :integer
    add_column :users, :total_order, :integer
  end
end
