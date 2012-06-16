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

ActiveRecord::Schema.define(:version => 20120615203641) do

  create_table "channels", :force => true do |t|
    t.integer  "broadcastable_id"
    t.string   "broadcastable_type"
    t.string   "channel_ident"
    t.datetime "last_validated"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "channels", ["broadcastable_id", "broadcastable_type"], :name => "index_channels_on_broadcastable_id_and_broadcastable_type"

  create_table "followings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "followings", ["follower_id"], :name => "index_followings_on_follower_id"
  add_index "followings", ["user_id"], :name => "index_followings_on_user_id"

  create_table "mentions", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mentions", ["post_id"], :name => "index_mentions_on_post_id"
  add_index "mentions", ["user_id"], :name => "index_mentions_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "reply_to_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "tag_list"
  end

  add_index "posts", ["city"], :name => "index_posts_on_city"
  add_index "posts", ["country"], :name => "index_posts_on_country"
  add_index "posts", ["reply_to_id"], :name => "index_posts_on_reply_to_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "posts_tags", :force => true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "posts_tags", ["post_id"], :name => "index_posts_tags_on_post_id"
  add_index "posts_tags", ["tag_id"], :name => "index_posts_tags_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["content"], :name => "index_tags_on_content", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "description"
    t.string   "username"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
