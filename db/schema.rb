# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_17_221625) do
  create_table "categories", force: :cascade do |t|
    t.string "categoryName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dictionary_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linked_sets", force: :cascade do |t|
    t.integer "WordsSet_id"
    t.integer "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_linked_sets_on_User_id"
    t.index ["WordsSet_id"], name: "index_linked_sets_on_WordsSet_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "result"
    t.integer "maxResult"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer "statistics_id"
    t.time "startTime"
    t.time "endTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistics_id"], name: "index_tests_on_statistics_id"
  end

  create_table "translations", force: :cascade do |t|
    t.string "translation"
    t.integer "language_id"
    t.integer "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_translations_on_language_id"
    t.index ["word_id"], name: "index_translations_on_word_id"
  end

  create_table "unlearned_words", force: :cascade do |t|
    t.integer "word_id"
    t.integer "statistics_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistics_id"], name: "index_unlearned_words_on_statistics_id"
    t.index ["word_id"], name: "index_unlearned_words_on_word_id"
  end

  create_table "user_tests", force: :cascade do |t|
    t.integer "Test_id"
    t.integer "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Test_id"], name: "index_user_tests_on_Test_id"
    t.index ["User_id"], name: "index_user_tests_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName", limit: 20, null: false
    t.string "lastName", limit: 20, null: false
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "birthday", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.integer "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_words_on_language_id"
  end

  create_table "words_sets", force: :cascade do |t|
    t.integer "Category_id"
    t.string "setName"
    t.string "description"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Category_id"], name: "index_words_sets_on_Category_id"
  end

  add_foreign_key "linked_sets", "Users"
  add_foreign_key "linked_sets", "WordsSets"
  add_foreign_key "tests", "statistics", column: "statistics_id"
  add_foreign_key "translations", "languages"
  add_foreign_key "translations", "words"
  add_foreign_key "unlearned_words", "statistics", column: "statistics_id"
  add_foreign_key "unlearned_words", "words"
  add_foreign_key "user_tests", "Tests"
  add_foreign_key "user_tests", "Users"
  add_foreign_key "users", "roles"
  add_foreign_key "words", "languages"
  add_foreign_key "words_sets", "Categories"
end
