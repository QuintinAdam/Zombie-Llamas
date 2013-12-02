class AddAttributesToGame < ActiveRecord::Migration
  def change
    add_column :games, :current_weapon, :string
    add_column :games, :current_base, :string
    add_column :games, :current_llama, :string
  end
end
