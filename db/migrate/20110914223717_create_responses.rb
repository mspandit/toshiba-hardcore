class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :online
      t.integer :watch
      t.integer :edit_movies
      t.integer :download
      t.integer :print
      t.integer :edit_photos
      t.integer :stream
      t.integer :digital
      t.integer :record
      t.integer :scrabble
      t.integer :rpg
      t.integer :shooters

      t.timestamps
    end
  end
end
