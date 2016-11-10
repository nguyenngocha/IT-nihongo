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

ActiveRecord::Schema.define(version: 20161110021423) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "musical_instrument_evaluates", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_musical_instrument_evaluates_on_post_id"
  end

  create_table "musical_instrument_images", force: :cascade do |t|
    t.integer  "musical_instrument_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["musical_instrument_id"], name: "index_musical_instrument_images_on_musical_instrument_id"
  end

  create_table "musical_instrument_sellers", force: :cascade do |t|
    t.integer  "musical_instrument_id"
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["musical_instrument_id"], name: "index_musical_instrument_sellers_on_musical_instrument_id"
  end

  create_table "musical_instruments", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "material"
    t.string   "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_evaluates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_evaluates_on_post_id"
    t.index ["user_id"], name: "index_post_evaluates_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "musical_instrument_id"
    t.string   "content"
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.integer  "sound_quality"
    t.integer  "felling"
    t.string   "accessories"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["musical_instrument_id"], name: "index_posts_on_musical_instrument_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "old"
    t.integer  "gender"
    t.string   "address"
    t.string   "contact"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role",                   default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
