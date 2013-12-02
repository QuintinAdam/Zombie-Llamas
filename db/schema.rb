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

ActiveRecord::Schema.define(:version => 20131202015319) do

  create_table "games", :force => true do |t|
    t.integer  "user_id"
    t.datetime "time_last_clicked"
    t.string   "location"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "current_weapon"
    t.string   "current_base"
    t.string   "current_llama"
  end

  add_index "games", ["user_id"], :name => "index_games_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "user_bases", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "decription"
    t.integer  "defence"
    t.integer  "defence_bonus"
    t.integer  "luck"
    t.integer  "order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "user_bases", ["user_id"], :name => "index_user_bases_on_user_id"

  create_table "user_events", :force => true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.text     "description"
    t.string   "negative"
    t.string   "positive"
    t.string   "effect"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_events", ["game_id"], :name => "index_user_events_on_game_id"

  create_table "user_llamas", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "decription"
    t.integer  "power"
    t.integer  "power_bonus"
    t.integer  "defence"
    t.integer  "defence_bonus"
    t.integer  "luck"
    t.integer  "order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "user_llamas", ["user_id"], :name => "index_user_llamas_on_user_id"

  create_table "user_weapons", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "decription"
    t.integer  "power"
    t.integer  "power_bonus"
    t.integer  "luck"
    t.integer  "order"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_weapons", ["user_id"], :name => "index_user_weapons_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "points"
    t.integer  "gold"
    t.integer  "population"
    t.integer  "total_power"
    t.integer  "total_defense"
    t.integer  "total_luck"
    t.integer  "total_order"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
