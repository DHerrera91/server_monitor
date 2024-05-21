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

ActiveRecord::Schema[7.1].define(version: 2024_05_21_160429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_type_servers", force: :cascade do |t|
    t.integer "event_type_id", null: false
    t.integer "server_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.integer "server_id"
    t.string "action_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "log_event_types", force: :cascade do |t|
    t.integer "log_id", null: false
    t.integer "event_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer "event_type_id"
    t.string "request_method"
    t.integer "status"
    t.string "url"
    t.string "path"
    t.string "user_agent"
    t.string "ip"
    t.float "time_spent"
    t.string "error_type"
    t.string "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_logs_on_users_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers", force: :cascade do |t|
    t.string "ip"
    t.string "name"
    t.boolean "operational_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "regions_id"
    t.index ["regions_id"], name: "index_servers_on_regions_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "jti"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_type_servers", "event_types"
  add_foreign_key "event_type_servers", "servers"
  add_foreign_key "log_event_types", "event_types"
  add_foreign_key "log_event_types", "logs"
  add_foreign_key "logs", "users", column: "users_id"
  add_foreign_key "servers", "regions", column: "regions_id"
end
