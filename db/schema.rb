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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140218113823) do

  create_table "commands", force: true do |t|
    t.string   "text"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commands", ["game_id"], name: "index_commands_on_game_id"

  create_table "games", force: true do |t|
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_scene_id"
    t.integer  "user_id"
    t.boolean  "finished"
  end

  add_index "games", ["story_id"], name: "index_games_on_story_id"
  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "history_entries", force: true do |t|
    t.integer  "scene_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "history_entries", ["game_id"], name: "index_history_entries_on_game_id"

  create_table "scenes", force: true do |t|
    t.text     "description"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scenes", ["story_id"], name: "index_scenes_on_story_id"

  create_table "stories", force: true do |t|
    t.string   "title"
    t.text     "abstract"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "triggers", force: true do |t|
    t.string   "text"
    t.integer  "scene_id"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "triggers", ["scene_id"], name: "index_triggers_on_scene_id"
  add_index "triggers", ["target_id"], name: "index_triggers_on_target_id"

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "email"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
