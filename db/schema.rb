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

ActiveRecord::Schema[7.1].define(version: 2025_03_13_213037) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_invitations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "guest_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_join_requests", force: :cascade do |t|
    t.integer "event_id"
    t.integer "guest_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_registrations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "game_id"
    t.string "skill_level"
    t.integer "host_id"
    t.integer "seats_available"
    t.integer "seats_total"
    t.string "neighborhood"
    t.string "street_address"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.text "description"
    t.string "visibility"
    t.string "approval_requirement"
    t.string "status"
    t.integer "rsvps_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "genre"
    t.string "complexity"
    t.string "randomness"
    t.string "min_players"
    t.string "max_players"
    t.string "duration"
    t.string "rating"
    t.string "website"
    t.integer "events_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "favorite_game"
    t.text "bio"
    t.integer "hosted_events_count"
    t.integer "friendships_as_user_count"
    t.integer "friendships_as_friend_count"
    t.integer "registrations_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
