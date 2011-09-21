# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110921171047) do

  create_table "items", :force => true do |t|
    t.integer  "speed"
    t.integer  "price"
    t.integer  "memory"
    t.integer  "hard"
    t.integer  "optical"
    t.string   "name"
    t.string   "description"
    t.string   "product_url"
    t.string   "image_url"
    t.float    "import_price"
    t.string   "import_proc_type"
    t.string   "import_proc_speed"
    t.string   "import_proc_number"
    t.string   "import_memory"
    t.string   "import_graphics"
    t.string   "import_hard"
    t.string   "import_optical"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", :force => true do |t|
    t.integer  "online"
    t.integer  "watch"
    t.integer  "edit_movies"
    t.integer  "download"
    t.integer  "print"
    t.integer  "edit_photos"
    t.integer  "stream"
    t.integer  "digital"
    t.integer  "record"
    t.integer  "scrabble"
    t.integer  "rpg"
    t.integer  "shooters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
