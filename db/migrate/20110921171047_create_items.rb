class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :speed
      t.float :price
      t.float :memory
      t.float :hard
      t.float :optical
      t.string :name
      t.string :description
      t.string :product_url
      t.string :image_url
      t.float :import_price
      t.string :import_proc_type
      t.string :import_proc_speed
      t.string :import_proc_number
      t.string :import_memory
      t.string :import_graphics
      t.string :import_hard
      t.string :import_optical

      t.timestamps
    end
  end
end
