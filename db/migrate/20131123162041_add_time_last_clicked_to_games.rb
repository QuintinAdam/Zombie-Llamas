class AddTimeLastClickedToGames < ActiveRecord::Migration
  def change
    add_column :games, :time_last_clicked, :datetime
  end
end
