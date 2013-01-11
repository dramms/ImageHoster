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

ActiveRecord::Schema.define(:version => 20130111141205) do

  create_table "file_uploads", :force => true do |t|
    t.string   "file_path"
    t.integer  "user_id"
    t.string   "file_type"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "project_id"
    t.string   "images_file_name"
    t.string   "images_content_type"
    t.integer  "images_file_size"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
