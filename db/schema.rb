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

ActiveRecord::Schema.define(version: 5) do

  create_table "bildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.string "printer_ip"
    t.string "printer_uid"
    t.string "printer_name"
    t.datetime "check_time"
    t.text "pages_css"
    t.bollean "pages_critical"
    t.integer "pages_percent"
    t.integer "pages_print"

    t.text "comment"
    t.text "percent_spool"
    t.text "error_spool"
    t.integer "summa", default: 0
    t.string "telefon", default: "79926000000"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "from_full_name"
    t.string "from_address"
    t.string "from_email"
    t.string "from_phone"
    t.string "to_full_name"
    t.string "to_address"
    t.string "to_email"
    t.string "to_phone"
    t.string "status"
    t.decimal "discount", precision: 10
    t.decimal "vat", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.date "date"
    t.boolean "print_pass", default: false
    t.string "bild"
    t.integer "user_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "report_sms"
    t.string "report_print"
    t.string "report_time"
    t.index ["profile_id"], name: "index_passes_on_profile_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "company_name"
    t.string "email"
    t.text "company_address"
    t.text "description"
    t.boolean "company_active", default: false
    t.string "company_kpp"
    t.string "bild"
    t.string "telefon_mobile"
    t.string "contact_name"
    t.text "company_description"
    t.text "print_header"
    t.text "print_cellar"
    t.string "company_inn"
    t.text "company_org_address"
    t.text "company_bank"
    t.integer "pass_id"
    t.integer "user_id"
    t.string "agreement"
    t.string "company_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "password_name", default: "", null: false
    t.boolean "user_active", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
