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

ActiveRecord::Schema.define(version: 20130606223612) do

  create_table "bets", force: true do |t|
    t.datetime "date_time"
    t.string   "away_team"
    t.string   "home_team"
    t.string   "play"
    t.integer  "line"
    t.float    "risk"
    t.string   "grade"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bets", ["user_id"], name: "index_bets_on_user_id"

  create_table "matchups", force: true do |t|
    t.string   "away_team"
    t.string   "home_team"
    t.string   "away_pitcher"
    t.string   "home_pitcher"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date_time"
  end

  create_table "moneylines", force: true do |t|
    t.datetime "date_time"
    t.string   "sportsbook"
    t.integer  "away_ml"
    t.integer  "home_ml"
    t.integer  "matchup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "moneylines", ["matchup_id"], name: "index_moneylines_on_matchup_id"

  create_table "percents", force: true do |t|
    t.float    "away_ml"
    t.float    "home_ml"
    t.float    "over"
    t.float    "under"
    t.integer  "matchup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "percents", ["matchup_id"], name: "index_percents_on_matchup_id"

  create_table "totals", force: true do |t|
    t.datetime "date_time"
    t.string   "sportsbook"
    t.string   "total"
    t.integer  "over_odds"
    t.integer  "under_odds"
    t.integer  "matchup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "totals", ["matchup_id"], name: "index_totals_on_matchup_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
