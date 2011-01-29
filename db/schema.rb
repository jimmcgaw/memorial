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

ActiveRecord::Schema.define(:version => 20110129081529) do

  create_table "eulogies", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id",    :null => false
    t.integer  "memory_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "eulogies", ["memory_id"], :name => "fk_eulogies_memory_id"
  add_index "eulogies", ["user_id"], :name => "fk_eulogies_user_id"

  create_table "funerals", :force => true do |t|
    t.string   "where"
    t.datetime "when"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone_number"
    t.text     "instructions"
    t.integer  "memory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funerals", ["memory_id"], :name => "fk_funerals_memory_id"

  create_table "memories", :force => true do |t|
    t.string   "first_name",                      :null => false
    t.string   "middle_name"
    t.string   "last_name",                       :null => false
    t.string   "epitaph"
    t.date     "date_of_birth"
    t.date     "date_of_death"
    t.text     "description",                     :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink",                       :null => false
    t.boolean  "show_funeral",  :default => true
  end

  add_index "memories", ["user_id"], :name => "fk_memories_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                                 :null => false
    t.string   "encrypted_password",                                    :null => false
    t.string   "first_name",                                            :null => false
    t.string   "last_name",                                             :null => false
    t.datetime "last_login",         :default => '2011-01-24 00:00:00'
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",                                                  :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
