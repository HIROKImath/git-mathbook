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

ActiveRecord::Schema.define(version: 2023_07_21_032645) do

  create_table "book_articles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.string "title", null: false
    t.text "body"
    t.integer "page", null: false
    t.integer "chapter"
    t.integer "section"
    t.string "article_image_id"
    t.integer "topic_main_id"
    t.integer "topic_sub_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_images", force: :cascade do |t|
    t.string "book_image_main_id"
    t.string "book_image_sub1_id"
    t.string "book_image_sub2_id"
    t.string "book_image_sub3_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "user_id"
    t.string "title", null: false
    t.string "author", null: false
    t.string "book_image_id"
    t.integer "branch_id"
    t.integer "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.text "introduction"
    t.string "profile_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
