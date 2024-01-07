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

ActiveRecord::Schema.define(version: 2020_10_02_150823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "translation_id"
    t.integer "user_id"
    t.string "role"
    t.boolean "active"
    t.integer "place"
    t.boolean "ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "ccs"
    t.integer "vcs"
    t.integer "ct"
    t.integer "vt"
    t.integer "majtes"
    t.integer "tietes"
    t.integer "ccs_m"
    t.integer "ccs_k"
    t.integer "vcs_a"
    t.integer "vcs_c"
    t.integer "vcs_t"
    t.integer "vcs_p"
    t.string "notes"
  end

  create_table "contributions", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "assignment_id"
    t.bigint "edit_id"
    t.integer "effort_in_seconds", default: 0, null: false
    t.integer "base_edit_id"
    t.string "base"
    t.index ["assignment_id"], name: "index_contributions_on_assignment_id"
    t.index ["edit_id"], name: "index_contributions_on_edit_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "edit_users", force: :cascade do |t|
    t.integer "edit_id"
    t.integer "user_id"
  end

  create_table "edits", force: :cascade do |t|
    t.string "content"
    t.boolean "hid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sentence_id"
    t.string "top", limit: 1, null: false
    t.integer "mods", default: 0
  end

  create_table "lookups", force: :cascade do |t|
    t.integer "rsub"
    t.integer "blk"
    t.integer "sub"
    t.bigint "translation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["translation_id"], name: "index_lookups_on_translation_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.date "dod"
    t.string "tod"
    t.string "dow"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descriptor"
  end

  create_table "sentences", force: :cascade do |t|
    t.integer "blk"
    t.integer "rsub"
    t.integer "sen"
    t.string "typ"
    t.boolean "tie"
    t.bigint "translation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rsen"
    t.integer "sub"
    t.index ["translation_id"], name: "index_sentences_on_translation_id"
  end

  create_table "translations", force: :cascade do |t|
    t.string "lan"
    t.string "tran_title"
    t.string "descrip"
    t.integer "blkc"
    t.integer "subc"
    t.integer "senc"
    t.string "xcrip"
    t.bigint "message_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "eng_tran_id"
    t.boolean "li"
    t.date "pubdate"
    t.string "version"
    t.index ["message_id"], name: "index_translations_on_message_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "confirmed"
    t.boolean "admin", default: false
    t.integer "cur_assign_id"
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
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contributions", "assignments"
  add_foreign_key "contributions", "edits"
  add_foreign_key "lookups", "translations"
  add_foreign_key "sentences", "translations"
  add_foreign_key "translations", "messages"
end
