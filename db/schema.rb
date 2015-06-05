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

ActiveRecord::Schema.define(version: 20150605141648) do

  create_table "addresses", force: true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "clientnumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phoneNumber"
    t.boolean  "primaryContact"
  end

  add_index "contacts", ["address_id"], name: "index_contacts_on_address_id"
  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id"

  create_table "deduping_instructions", force: true do |t|
    t.string   "name"
    t.text     "instruction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "error_record_handlings", force: true do |t|
    t.string   "name"
    t.text     "instruction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inserts", force: true do |t|
    t.boolean  "hand"
    t.boolean  "machine"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_classes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailing_specs", force: true do |t|
    t.decimal  "height"
    t.decimal  "width"
    t.integer  "sampleSize"
    t.decimal  "weightOfSample"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permits", force: true do |t|
    t.string   "permitHolder"
    t.integer  "client_id"
    t.string   "crid"
    t.string   "nonprofitAuthorizationNumber"
    t.string   "postOffice"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permit_number"
  end

  add_index "permits", ["client_id"], name: "index_permits_on_client_id"
  add_index "permits", ["contact_id"], name: "index_permits_on_contact_id"

  create_table "piece_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "postage_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "presort_informations", force: true do |t|
    t.integer  "error_record_handling_id"
    t.integer  "deduping_instructions_id"
    t.boolean  "suppression"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "errors_removed"
    t.integer  "duplicates_removed"
    t.boolean  "dropship"
    t.string   "dropshipLocation"
    t.integer  "work_order_id"
    t.integer  "permit_id"
    t.integer  "mailing_specs_id"
    t.integer  "mail_class_id"
    t.integer  "sortation_id"
    t.integer  "labels_id"
  end

  add_index "presort_informations", ["deduping_instructions_id"], name: "index_presort_informations_on_deduping_instructions_id"
  add_index "presort_informations", ["error_record_handling_id"], name: "index_presort_informations_on_error_record_handling_id"
  add_index "presort_informations", ["labels_id"], name: "index_presort_informations_on_labels_id"
  add_index "presort_informations", ["mail_class_id"], name: "index_presort_informations_on_mail_class_id"
  add_index "presort_informations", ["mailing_specs_id"], name: "index_presort_informations_on_mailing_specs_id"
  add_index "presort_informations", ["permit_id"], name: "index_presort_informations_on_permit_id"
  add_index "presort_informations", ["sortation_id"], name: "index_presort_informations_on_sortation_id"
  add_index "presort_informations", ["work_order_id"], name: "index_presort_informations_on_work_order_id"

  create_table "printing_instructions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paperStock"
    t.boolean  "color"
    t.boolean  "duplex"
    t.integer  "nUp"
    t.boolean  "variableData"
    t.integer  "work_order_id"
  end

  add_index "printing_instructions", ["work_order_id"], name: "index_printing_instructions_on_work_order_id"

  create_table "production_detail_inserts", force: true do |t|
    t.integer  "insert_id"
    t.integer  "production_details_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_detail_inserts", ["insert_id"], name: "index_production_detail_inserts_on_insert_id"
  add_index "production_detail_inserts", ["production_details_id"], name: "index_production_detail_inserts_on_production_details_id"

  create_table "production_detail_tabs", force: true do |t|
    t.string   "production_details_id"
    t.string   "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_detail_tabs", ["production_details_id"], name: "index_production_detail_tabs_on_production_details_id"
  add_index "production_detail_tabs", ["tab_id"], name: "index_production_detail_tabs_on_tab_id"

  create_table "production_details", force: true do |t|
    t.integer  "WorkOrder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_order_id"
  end

  add_index "production_details", ["WorkOrder_id"], name: "index_production_details_on_WorkOrder_id"

  create_table "project_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "mailing"
    t.boolean  "printing"
  end

  create_table "sortations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tabs", force: true do |t|
    t.string   "location"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_orders", force: true do |t|
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dueDate"
    t.string   "number"
    t.integer  "project_type_id"
    t.string   "monthlySequenceNumber"
    t.text     "projectDescription"
  end

  add_index "work_orders", ["client_id"], name: "index_work_orders_on_client_id"
  add_index "work_orders", ["project_type_id"], name: "index_work_orders_on_project_type_id"

end
