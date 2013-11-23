class AddNameDescriptionTypeInteractionToEvent < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    add_column :events, :description, :text
    add_column :events, :type, :boolean
    add_column :events, :interaction, :string
  end
end
