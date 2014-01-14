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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140114174039) do

  create_table "medicine_histories", :force => true do |t|
    t.datetime "actualHour"
    t.integer  "c_type"
    t.boolean  "isFirstHour"
    t.integer  "medicine_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "medicines", :force => true do |t|
    t.string   "name"
    t.integer  "daysOffset"
    t.datetime "firstHour"
    t.datetime "secondHour"
    t.boolean  "isSpecificDays"
    t.integer  "specificDays"
    t.datetime "canceledNotificationDate"
    t.datetime "daysOffsetStartDate"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "user_id"
  end

  create_table "picklines", :force => true do |t|
    t.datetime "red_last_wash_date"
    t.datetime "blue_last_wash_date"
    t.datetime "bandage_replacement_date"
    t.datetime "blue_ventile_replacement_date"
    t.datetime "red_ventile_replacement_date"
    t.integer  "bandage_interval_days"
    t.datetime "parpar_replacement_date"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
