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

ActiveRecord::Schema.define(:version => 20120817235328) do

  create_table "github_activities", :force => true do |t|
    t.string   "author_name"
    t.string   "author_email"
    t.string   "git_sha"
    t.string   "message"
    t.string   "github_url"
    t.datetime "occurred_at"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pivotal_tracker_activities", :force => true do |t|
    t.integer  "pt_id"
    t.integer  "version"
    t.string   "event_type"
    t.datetime "occurred_at"
    t.string   "author"
    t.integer  "project_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "story_id"
    t.string   "story_url"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "api_key"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "password",   :default => "", :null => false
  end

end
