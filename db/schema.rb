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

ActiveRecord::Schema.define(version: 20170105144637) do

  create_table "helpees", force: :cascade do |t|
    t.string   "user_id"
    t.string   "tweet_id"
    t.string   "handle"
    t.text     "place"
    t.text     "address"
    t.text     "reps"
    t.text     "other_reps"
    t.text     "name"
    t.string   "location"
    t.string   "description"
    t.string   "followers_count"
    t.string   "statuses_count"
    t.string   "join_date"
    t.boolean  "geo_enabled"
    t.boolean  "verified"
    t.string   "language"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "geo_place"
  end

end
