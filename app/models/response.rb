class Response < ActiveRecord::Base
  attr_accessor :online2, :watch2, :edit_movies2, :download2, :print2, :edit_photos2, :stream2, :digital2, :record2, :scrabble2, :rpg2, :shooters2, :desk_work2, :planes_trains2, :coffee_shops2, :docs2, :blogging2, :architecture2
  
  def empty?
    [
      :online, 
      :watch, 
      :edit_movies, 
      :download, 
      :print, 
      :edit_photos, 
      :stream, 
      :digital, 
      :record, 
      :scrabble, 
      :rpg, 
      :shooters, 
      :desk_work, 
      :planes_trains, 
      :coffee_shops, 
      :docs, 
      :blogging, 
      :architecture
    ].inject(true) { |current, field| current && (send(field) == 0) }
  end
end
