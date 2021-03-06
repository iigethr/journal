# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_06_154647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "slug", default: "", null: false
    t.bigint "union_id", null: false
    t.string "act_type", null: false
    t.bigint "act_id", null: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_agents_on_slug"
    t.index ["union_id"], name: "index_agents_on_union_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.bigint "journal_id", null: false
    t.string "title"
    t.text "description"
    t.boolean "published", default: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_id"], name: "index_articles_on_journal_id"
    t.index ["slug"], name: "index_articles_on_slug"
  end

  create_table "documents", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.string "label"
    t.string "caption"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_documents_on_slug"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.string "label"
    t.string "caption"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_galleries_on_slug"
  end

  create_table "journals", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.string "title"
    t.text "description"
    t.boolean "published", default: false
    t.integer "position"
    t.string "access_id", default: "", null: false
    t.string "access_token", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["access_id"], name: "index_journals_on_access_id"
    t.index ["access_token"], name: "index_journals_on_access_token"
    t.index ["slug"], name: "index_journals_on_slug"
  end

  create_table "passkeys", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.bigint "user_id", null: false
    t.bigint "journal_id", null: false
    t.boolean "active", default: false
    t.string "role", default: "collaborator"
    t.string "email"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_id"], name: "index_passkeys_on_journal_id"
    t.index ["slug"], name: "index_passkeys_on_slug"
    t.index ["user_id"], name: "index_passkeys_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.string "label"
    t.string "caption"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_pictures_on_slug"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.string "label"
    t.text "body"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_pieces_on_slug"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_profiles_on_slug"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.bigint "journal_id", null: false
    t.string "title"
    t.text "description"
    t.boolean "published", default: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_id"], name: "index_sections_on_journal_id"
    t.index ["slug"], name: "index_sections_on_slug"
  end

  create_table "unions", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.string "member_type", null: false
    t.bigint "member_id", null: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_unions_on_slug"
  end

  create_table "users", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.boolean "active", default: false
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug"
  end

  create_table "videos", force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.string "label"
    t.string "caption"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_videos_on_slug"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agents", "unions"
  add_foreign_key "articles", "journals"
  add_foreign_key "passkeys", "journals"
  add_foreign_key "passkeys", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "sections", "journals"
end
