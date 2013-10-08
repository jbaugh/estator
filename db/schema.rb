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

ActiveRecord::Schema.define(:version => 20131008052317) do

  create_table "properties", :force => true do |t|
    t.string   "name",          :limit => 150
    t.integer  "property_type"
    t.integer  "status"
    t.integer  "price"
    t.integer  "year_built"
    t.integer  "square_feet"
    t.integer  "lot_size"
    t.string   "image_url"
    t.decimal  "baths"
    t.decimal  "bedrooms"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "properties", ["baths"], :name => "index_properties_on_baths"
  add_index "properties", ["bedrooms"], :name => "index_properties_on_bedrooms"
  add_index "properties", ["created_at"], :name => "index_properties_on_created_at"
  add_index "properties", ["lot_size"], :name => "index_properties_on_lot_size"
  add_index "properties", ["price"], :name => "index_properties_on_price"
  add_index "properties", ["property_type"], :name => "index_properties_on_property_type"
  add_index "properties", ["square_feet"], :name => "index_properties_on_square_feet"
  add_index "properties", ["status"], :name => "index_properties_on_status"
  add_index "properties", ["year_built"], :name => "index_properties_on_year_built"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
