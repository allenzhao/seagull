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

ActiveRecord::Schema.define(version: 20150318101726) do

  create_table "class_rooms", force: :cascade do |t|
    t.string   "IP",            limit: 255
    t.string   "room_name",     limit: 255
    t.string   "computer_name", limit: 255
    t.string   "location",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer  "student_id",     limit: 4
    t.integer  "class_room_id",  limit: 4
    t.datetime "check_in_time"
    t.datetime "check_out_time"
    t.datetime "change_time"
    t.datetime "checkout_time"
    t.datetime "keep_time"
    t.integer  "sign_in_status", limit: 4
    t.integer  "action",         limit: 4
    t.integer  "state",          limit: 4
    t.string   "message",        limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "details", ["class_room_id"], name: "index_details_on_class_room_id", using: :btree
  add_index "details", ["student_id"], name: "index_details_on_student_id", using: :btree

  create_table "error_logs", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.string   "ip",         limit: 255
    t.integer  "status",     limit: 4
    t.string   "detail",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description",    limit: 65535
    t.integer  "student_id",     limit: 4
    t.integer  "status",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "team_member_id", limit: 4
  end

  add_index "issues", ["student_id"], name: "index_issues_on_student_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.integer  "student_id",     limit: 4
    t.integer  "required_times", limit: 4
    t.integer  "real_times",     limit: 4
    t.integer  "leave_times",    limit: 4
    t.integer  "error_times",    limit: 4
    t.integer  "total_time",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "records", ["student_id"], name: "index_records_on_student_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "weekday",    limit: 4
    t.integer  "lesson",     limit: 4
    t.integer  "location",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "student_number", limit: 4
    t.integer  "school",         limit: 4
    t.string   "grade",          limit: 255
    t.string   "student_class",  limit: 255
    t.string   "major",          limit: 255
    t.integer  "sex",            limit: 4
    t.string   "phone_number",   limit: 255
    t.string   "dyned_class",    limit: 255
    t.string   "email",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "finished",       limit: 1
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "team_members", force: :cascade do |t|
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.string   "email",        limit: 255
    t.string   "phone_number", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",      limit: 4
    t.string   "title",        limit: 255
  end

  add_index "team_members", ["user_id"], name: "index_team_members_on_user_id", using: :btree

  create_table "term_plans", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "weekday",    limit: 4
    t.integer  "lesson",     limit: 4
    t.integer  "location",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255,   null: false
    t.integer  "item_id",        limit: 4,     null: false
    t.string   "event",          limit: 255,   null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object",         limit: 65535
    t.datetime "created_at"
    t.text     "object_changes", limit: 65535
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "week_plans", force: :cascade do |t|
    t.datetime "start_checkin_time"
    t.datetime "late_checkin_time"
    t.datetime "end_checkin_time"
    t.datetime "start_checkout_time"
    t.datetime "end_checkout_time"
    t.integer  "weekday",             limit: 4
    t.integer  "lesson",              limit: 4
    t.integer  "location",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_foreign_key "details", "class_rooms"
  add_foreign_key "details", "students"
  add_foreign_key "issues", "students"
  add_foreign_key "records", "students"
  add_foreign_key "team_members", "users"
end
