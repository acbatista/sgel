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

ActiveRecord::Schema.define(version: 20151030142328) do

  create_table "books", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "author",        limit: 255
    t.text     "description",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id",       limit: 4
    t.integer  "reviews_count", limit: 4
    t.string   "slug",          limit: 255
    t.string   "picture",       limit: 255
  end

  add_index "books", ["slug"], name: "index_books_on_slug", unique: true, using: :btree
  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "book_id",    limit: 4
    t.integer  "points",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reviews", ["book_id"], name: "fk_rails_924a0b30ca", using: :btree
  add_index "reviews", ["user_id", "book_id"], name: "index_reviews_on_user_id_and_book_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "full_name",          limit: 255
    t.string   "email",              limit: 255
    t.string   "location",           limit: 255
    t.text     "bio",                limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "password_digest",    limit: 255
    t.datetime "confirmed_at"
    t.string   "confirmation_token", limit: 255
    t.string   "telefone",           limit: 255
  end

  add_foreign_key "books", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
