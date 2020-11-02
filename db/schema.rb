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

ActiveRecord::Schema.define(version: 0) do

  create_table "announcements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message", null: false
    t.datetime "date"
    t.string "username", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["username"], name: "index_on_announcements_and_username"
  end

  create_table "bills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id", default: 0, null: false
    t.bigint "product_id", default: 0, null: false
    t.string "product_name", null: false
    t.string "link"
    t.string "phone"
    t.string "account_ya", null: false
    t.datetime "date_order", null: false
    t.string "username", null: false
    t.string "full_name"
    t.float "amount", default: 0.0, null: false
    t.float "price", default: 0.0, null: false
    t.float "price_transport_jp", default: 0.0, null: false
    t.float "tax_jp", default: 0.0, null: false
    t.float "rate", default: 0.0
    t.float "price_buy", default: 0.0, null: false
    t.float "weight", default: 0.0, null: false
    t.float "price_transport_vn", default: 0.0, null: false
    t.integer "status", default: 0, null: false
    t.float "sub_fee", default: 0.0, null: false
    t.integer "number_tracking", default: 0
    t.integer "term", default: 0
    t.datetime "delivery_time"
    t.float "paid_money", default: 0.0, null: false
    t.integer "type_paid", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["account_ya"], name: "index_on_bills_and_account_ya"
    t.index ["phone"], name: "index_on_bills_and_phone"
  end

  create_table "budgets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "full_name"
    t.string "username"
    t.float "amount_money_jp", default: 0.0, null: false
    t.float "latest_rate", default: 0.0
    t.float "amount_money_vn_used", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["username"], name: "index_on_budgets_and_username"
  end

  create_table "customer_transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.string "account_ya", null: false
    t.float "money", default: 0.0, null: false
    t.bigint "customer_id", null: false
    t.string "username", null: false
    t.text "note"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["account_ya"], name: "index_on_customer_transactions_and_account_ya"
    t.index ["customer_id"], name: "index_on_customer_transactions_and_customer_id"
    t.index ["phone"], name: "index_on_customer_transactions_and_phone"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.datetime "dob"
    t.string "identify"
    t.string "phone"
    t.string "email"
    t.float "price_buy", default: 0.0, null: false
    t.float "price_transport_vn", default: 0.0, null: false
    t.float "rate", default: 0.0
    t.string "address"
    t.string "account_ya", null: false
    t.string "password_digest", default: "0", null: false
    t.float "money", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["account_ya"], name: "index_on_customers_and_account_ya"
    t.index ["phone"], name: "index_on_customers_and_phone"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.float "price", default: 0.0, null: false
    t.text "note"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "request_jp_moneys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "requested_user_id", null: false
    t.bigint "confirmed_user_id"
    t.string "requested_user_name"
    t.string "confirmed_user_name"
    t.float "money_jp", default: 0.0, null: false
    t.float "rate", default: 0.0
    t.float "money_vn", default: 0.0, null: false
    t.integer "status", default: 0, null: false
    t.text "reason"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["confirmed_user_id"], name: "index_on_request_jp_moneys_and_confirmed_user_id"
    t.index ["requested_user_id"], name: "index_on_request_jp_moneys_and_requested_user_id"
  end

  create_table "time_sheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username", null: false
    t.string "full_name"
    t.string "phone"
    t.datetime "time_in"
    t.datetime "time_out"
    t.float "working_time", default: 0.0, null: false
    t.integer "status", default: 0, null: false
    t.string "bonus"
    t.text "reason"
    t.integer "action", default: 0, null: false
    t.text "note"
    t.float "money", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["action"], name: "index_on_time_sheets_and_action"
    t.index ["status"], name: "index_on_time_sheets_and_status"
    t.index ["username"], name: "index_on_time_sheets_and_username"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username", null: false
    t.string "full_name"
    t.string "password_digest", null: false
    t.string "phone"
    t.string "email"
    t.datetime "dob"
    t.string "salary"
    t.string "bonus"
    t.string "identify"
    t.integer "role", default: 0, null: false
    t.text "login_time"
    t.text "permission"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["username"], name: "index_on_users_and_username"
  end

end
