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

ActiveRecord::Schema.define(version: 2019_04_06_154647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.integer "position"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "agents", force: :cascade do |t|
    t.string "slug"
    t.bigint "article_id"
    t.string "act_type"
    t.bigint "act_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["act_type", "act_id"], name: "index_agents_on_act_type_and_act_id"
    t.index ["article_id"], name: "index_agents_on_article_id"
    t.index ["slug"], name: "index_agents_on_slug"
  end

  create_table "articles", force: :cascade do |t|
    t.string "slug"
    t.bigint "publication_id"
    t.string "title"
    t.text "description"
    t.boolean "published", default: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_articles_on_publication_id"
    t.index ["slug"], name: "index_articles_on_slug"
  end

  create_table "documents", force: :cascade do |t|
    t.string "slug"
    t.string "caption"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_documents_on_slug"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "slug"
    t.string "caption"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_galleries_on_slug"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "slug"
    t.string "caption"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_pictures_on_slug"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "slug"
    t.bigint "user_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_profiles_on_slug"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "slug"
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.boolean "published", default: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_publications_on_slug"
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "texts", force: :cascade do |t|
    t.string "slug"
    t.text "body"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_texts_on_slug"
  end

  create_table "users", force: :cascade do |t|
    t.string "slug"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug"
  end

  create_table "videos", force: :cascade do |t|
    t.string "slug"
    t.string "caption"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_videos_on_slug"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agents", "articles"
  add_foreign_key "articles", "publications"
  add_foreign_key "profiles", "users"
  add_foreign_key "publications", "users"
end
