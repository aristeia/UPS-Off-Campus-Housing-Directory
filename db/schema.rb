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

ActiveRecord::Schema.define(:version => 20141215075217) do

  create_table "finances", :force => true do |t|
    t.integer  "landlord_id"
    t.datetime "datepaid"
    t.float    "amount"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "residence_id"
    t.string   "file_location"
    t.boolean  "is_default"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "landlords", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone1"
    t.string   "phone2"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "residence_id"
    t.integer  "review_id"
    t.integer  "user_id"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "residences", :force => true do |t|
    t.string   "address",                                    :default => ""
    t.string   "address2",                                   :default => ""
    t.string   "city",                                       :default => ""
    t.string   "state",                                      :default => ""
    t.string   "zipcode",                                    :default => ""
    t.string   "slug",                                       :default => ""
    t.string   "restype",                                    :default => ""
    t.integer  "bedrooms_available",          :limit => 255, :default => 0
    t.integer  "bedrooms_total",              :limit => 255, :default => 0
    t.integer  "bathrooms",                   :limit => 255, :default => 0
    t.float    "miles_from_campus",                          :default => 0.0
    t.integer  "total_monthly_rent",                         :default => 0
    t.string   "arrangement",                                :default => ""
    t.text     "description",                                :default => ""
    t.text     "notes",                                      :default => ""
    t.text     "furnishing",                                 :default => ""
    t.string   "parking",                                    :default => ""
    t.date     "available"
    t.string   "lease_term",                                 :default => ""
    t.integer  "security_deposit",                           :default => 0
    t.integer  "security_deposit_refundable",                :default => 0
    t.string   "heating_type",                               :default => ""
    t.boolean  "am_laundry",                                 :default => false
    t.boolean  "am_coin_op_laundry",                         :default => false
    t.boolean  "am_extra_storage",                           :default => false
    t.boolean  "am_cable_tv",                                :default => false
    t.boolean  "am_smoking_allowed",                         :default => false
    t.boolean  "am_smoke_detector",                          :default => false
    t.boolean  "am_ada_accessible",                          :default => false
    t.boolean  "am_internet_included",                       :default => false
    t.boolean  "am_stove",                                   :default => false
    t.boolean  "am_refrigerator",                            :default => false
    t.boolean  "am_dishwasher",                              :default => false
    t.boolean  "am_lawn_care_included",                      :default => false
    t.boolean  "am_water_included",                          :default => false
    t.boolean  "am_sewer_included",                          :default => false
    t.boolean  "am_garbage_included",                        :default => false
    t.boolean  "am_electricity_included",                    :default => false
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "landlord_id"
    t.integer  "image_id"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "visible"
  end

  create_table "reviews", :force => true do |t|
    t.string   "text"
    t.integer  "score"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "landlord_id"
  end

  create_table "student_users", :force => true do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "last_name"
    t.string "first_name"
    t.string "member_of"
    t.string "email"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "member_of"
    t.integer  "landlord_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
