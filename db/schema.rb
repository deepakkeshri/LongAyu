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

ActiveRecord::Schema.define(version: 20150713022045) do

  create_table "accounts", force: true do |t|
    t.integer  "mobile",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "accounts", ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true

  create_table "accounts_roles", id: false, force: true do |t|
    t.integer "account_id"
    t.integer "role_id"
  end

  add_index "accounts_roles", ["account_id", "role_id"], name: "index_accounts_roles_on_account_id_and_role_id"

  create_table "addresses", force: true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "landmark1"
    t.string   "landmark2"
    t.string   "landmark3"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "pin"
    t.integer  "addressable_id"
    t.string   "addessable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beauty_services", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "alt_name"
    t.string   "department"
    t.string   "speciality"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centre_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centres", force: true do |t|
    t.integer  "account_id",                                              null: false
    t.integer  "centre_id",               default: 0,                     null: false
    t.integer  "centre_type_id",          default: 1
    t.string   "unique_id",               default: "12345"
    t.string   "name",                    default: "Branch"
    t.string   "company"
    t.string   "website",                 default: "https://example.com"
    t.string   "close_day"
    t.datetime "open_time"
    t.datetime "close_time"
    t.datetime "lunch_start_time"
    t.datetime "lunch_end_time"
    t.string   "employee_count"
    t.string   "currency",                default: "INR"
    t.float    "minimum_consultancy_fee", default: 0.0
    t.string   "secondary_email"
    t.string   "country_mobile_code",     default: "+91"
    t.string   "secondary_mobile"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.string   "landmark1"
    t.string   "landmark2"
    t.string   "landmark3"
    t.string   "pincode"
    t.string   "city"
    t.string   "state"
    t.string   "country",                 default: "India"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "centres", ["account_id"], name: "index_centres_on_account_id"
  add_index "centres", ["centre_id"], name: "index_centres_on_centre_id"

  create_table "cities", force: true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "clinic_facility_travellers", force: true do |t|
    t.integer  "centre_id"
    t.boolean  "international_trael_friendly"
    t.text     "international_travel_friendly_description"
    t.boolean  "local_travel_friendly"
    t.text     "local_travel_friendly_description"
    t.boolean  "traveller_accomodation_friendly"
    t.text     "traveller_accomodation_friendly_description"
    t.boolean  "local_guide"
    t.text     "local_guide_description"
    t.boolean  "tour_and_vacation_services"
    t.text     "tour_and_vacation_services_description"
    t.boolean  "pickup_from_hotel"
    t.text     "pickup_from_hotel_decription"
    t.boolean  "pickup_from_airport"
    t.text     "pickup_from_airport_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "mobile_code"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_mobile_codes", force: true do |t|
    t.string   "name",       default: "+91"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", force: true do |t|
    t.integer  "facility_type_id"
    t.integer  "centre_id"
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.float    "dd_price"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facilities", ["centre_id"], name: "index_facilities_on_centre_id"
  add_index "facilities", ["facility_type_id"], name: "index_facilities_on_facility_type_id"

  create_table "facility_types", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.integer  "account_id",       default: 0, null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["account_id"], name: "index_identities_on_account_id"

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_tests", force: true do |t|
    t.string   "name",        null: false
    t.string   "short_name"
    t.string   "alt_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "centre_ids"
    t.string   "department"
    t.string   "speciality"
    t.text     "description"
  end

  create_table "medicines", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "alt_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_types", force: true do |t|
    t.string   "name"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "message_type_id", null: false
    t.string   "name"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["message_type_id"], name: "index_messages_on_message_type_id"

  create_table "patient_facility_insurances", force: true do |t|
    t.integer  "centre_id"
    t.boolean  "without_insurance_accepted"
    t.text     "without_insurance_accepted_description"
    t.boolean  "public_insurance_accepted"
    t.text     "public_insurance_accepted_description"
    t.boolean  "private_insurance_accepted"
    t.text     "private_insurance_accepted_description"
    t.boolean  "with_dental_pain_accepted"
    t.text     "with_dental_pain_accepted_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.integer  "account_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "title"
    t.string   "qualification"
    t.integer  "country_mobile_code_id"
    t.integer  "mobile_contact_no"
    t.integer  "home_contact_no"
    t.integer  "landline_no"
    t.integer  "fax_no"
    t.integer  "work_contact_no"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.integer  "postal_code_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "hide_name_in_review",    default: false
    t.boolean  "hide_photo_in_review",   default: false
    t.boolean  "email_subscription",     default: false
    t.boolean  "sms_subscription",       default: false
    t.string   "blood_group"
    t.date     "dob"
    t.float    "height"
    t.float    "weight"
    t.string   "gender"
    t.string   "language"
    t.string   "allergies"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["account_id"], name: "index_patients_on_account_id"
  add_index "patients", ["city_id"], name: "index_patients_on_city_id"
  add_index "patients", ["country_id"], name: "index_patients_on_country_id"
  add_index "patients", ["country_mobile_code_id"], name: "index_patients_on_country_mobile_code_id"
  add_index "patients", ["postal_code_id"], name: "index_patients_on_postal_code_id"
  add_index "patients", ["state_id"], name: "index_patients_on_state_id"

  create_table "payment_infos", force: true do |t|
    t.string   "currency"
    t.boolean  "cheque_accept"
    t.text     "cheque_accept_description"
    t.boolean  "debit_accept"
    t.text     "debit_accept_description"
    t.boolean  "credit_accept"
    t.text     "credit_accept_description"
    t.boolean  "wallet_accept"
    t.text     "wallet_accept_description"
    t.boolean  "cash_accept"
    t.text     "cash_accept_description"
    t.integer  "centre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postalcodes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "premises", force: true do |t|
    t.boolean  "parking"
    t.text     "parking_description"
    t.boolean  "accessible_to_disabled"
    t.text     "accessible_to_disabled_description"
    t.boolean  "public_transport_access"
    t.text     "public_transport_access_description"
    t.boolean  "access_without_steps"
    t.text     "access_without_steps_description"
    t.boolean  "disabled_parking"
    t.text     "disabled_parking_description"
    t.boolean  "patient_bathroom"
    t.text     "patient_bathroom_description"
    t.boolean  "wireless_access"
    t.text     "wireless_access_description"
    t.boolean  "onsite_pharmacy"
    t.text     "onsite_pharmacy_description"
    t.integer  "centre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.integer  "account_id",          default: 0,                     null: false
    t.string   "name"
    t.string   "property_id"
    t.string   "website",             default: "https://example.com"
    t.string   "language"
    t.string   "timezone"
    t.string   "country_mobile_code", default: "+91"
    t.string   "secondary_mobile"
    t.string   "secondary_email"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "landmark"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["account_id"], name: "index_properties_on_account_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "service_types", force: true do |t|
    t.integer  "centre_type_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.integer  "service_type_id"
    t.integer  "centre_id"
    t.string   "name"
    t.text     "description"
    t.string   "speciality"
    t.string   "department"
    t.float    "price"
    t.float    "tax"
    t.float    "dd_price"
    t.float    "dd_tax"
    t.float    "doctor_fee"
    t.float    "anesthesia_price"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "serviceable_id"
    t.string   "serviceable_type"
  end

  add_index "services", ["centre_id"], name: "index_services_on_centre_id"
  add_index "services", ["service_type_id"], name: "index_services_on_service_type_id"

  create_table "staff_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", force: true do |t|
    t.integer  "property_id"
    t.integer  "staff_type_id"
    t.string   "staff_id"
    t.string   "centre"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "email"
    t.string   "country_mobile_code", default: "+91"
    t.integer  "mobile"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "designation"
    t.text     "biography"
    t.integer  "qualification"
    t.string   "degree"
    t.string   "specialization"
    t.string   "language"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.integer  "pincode"
    t.string   "city"
    t.string   "state"
    t.string   "country",             default: "India"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "staffs", ["property_id"], name: "index_staffs_on_property_id"
  add_index "staffs", ["staff_type_id"], name: "index_staffs_on_staff_type_id"

  create_table "states", force: true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id"

  create_table "sub_service_types", force: true do |t|
    t.integer  "service_type_id", null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_service_types", ["service_type_id"], name: "index_sub_service_types_on_service_type_id"

end
