class AddResponses < ActiveRecord::Migration
  def up
    add_column :responses, :desk_work, :integer
    add_column :responses, :planes_trains, :integer
    add_column :responses, :coffee_shops, :integer
    add_column :responses, :docs, :integer
    add_column :responses, :blogging, :integer
    add_column :responses, :architecture, :integer
    
    add_column :items, :import_screen, :string
    add_column :items, :import_hdd_speed, :string
    add_column :items, :graphics, :float
    add_column :items, :hdd_speed, :float
    add_column :items, :screen, :float
  end

  def down
    remove_column :items, :screen
    remove_column :items, :hdd_speed
    remove_column :items, :graphics
    remove_column :items, :import_hdd_speed, :string
    remove_column :items, :import_screen, :string
    
    remove_column :responses, :architecture
    remove_column :responses, :blogging
    remove_column :responses, :docs
    remove_column :responses, :coffee_shops
    remove_column :responses, :planes_trains
    remove_column :responses, :desk_work
  end
end
