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

ActiveRecord::Schema.define(version: 20160226023148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.string   "link"
    t.string   "text"
    t.datetime "published_on"
    t.string   "thumbnail_img"
    t.string   "section"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "articles_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
  end

  add_index "articles_users", ["article_id"], name: "index_articles_users_on_article_id", using: :btree
  add_index "articles_users", ["user_id"], name: "index_articles_users_on_user_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "subjects", ["taggable_type", "taggable_id"], name: "index_subjects_on_taggable_type_and_taggable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "articles_users", "articles"
  add_foreign_key "articles_users", "users"
end
