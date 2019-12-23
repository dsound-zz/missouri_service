# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_18_151719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_records", force: :cascade do |t|
    t.string "action_type"
    t.string "action_case"
    t.string "action_effective_date"
    t.string "action_eligible_reinstate_date"
    t.string "action_status_code"
    t.string "action_status_date"
    t.string "action_state_offense"
    t.string "action_offense_date"
    t.string "action_ticket_num"
    t.string "action_hazmat_ind"
    t.string "action_state"
    t.string "action_out_state_eval"
    t.string "action_acd_code"
    t.string "wd_type_code"
    t.string "wd_basis_code"
    t.string "wd_due_proc_code"
    t.string "wd_ext_code"
    t.string "wd_ref_num"
    t.string "action_cdl_holder"
    t.string "wd_id"
    t.string "wd_bac_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "muid"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "basic_data_records", force: :cascade do |t|
    t.string "license"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "suffix"
    t.string "first_nm_t"
    t.string "last_name_t"
    t.string "middle_name_t"
    t.string "dob"
    t.string "sex"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "street_updated"
    t.string "city_updated"
    t.string "state_updated"
    t.string "zip_updated"
    t.string "height"
    t.string "weight"
    t.string "eyes"
    t.string "op_status"
    t.string "comm_status"
    t.string "school_bus_status"
    t.string "pending_activity_code"
    t.string "must_test"
    t.string "deceased"
    t.string "previous_cdl"
    t.string "cdl_pointer"
    t.string "pdps_pointer"
    t.string "mvr_privacy_code"
    t.string "brc_status_code"
    t.string "brc_status_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "street_address_one"
  end

  create_table "bulk_files", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "each_record"
  end

  create_table "license_issuance_records", force: :cascade do |t|
    t.string "license_issuance_code"
    t.string "license_class"
    t.string "license_expiration_date"
    t.string "license_sequential_number"
    t.string "license_surrendered_missouri"
    t.string "license_surrendered_to"
    t.string "license_num_former_driver"
    t.string "license_endorsemnts"
    t.string "license_restrictions"
    t.string "license_transaction_type"
    t.string "license_printed_data"
    t.string "permit_code"
    t.string "permit_class"
    t.string "permit_expiration_date"
    t.string "permit_seq_num"
    t.string "permit_endorsement_codes"
    t.string "permit_restriction_codes"
    t.string "permit_transaction_type"
    t.string "permit_printed_date"
    t.string "non_driver_issue_code"
    t.string "non_driver_exp_date"
    t.string "non_driver_seq_num"
    t.string "non_driver_trans_type"
    t.string "non_driver_print_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "muid"
  end

  create_table "medical_cert_records", force: :cascade do |t|
    t.string "med_certification_status"
    t.string "med_self_certification_code"
    t.string "med_restriction_codes"
    t.string "med_certification_issue_date"
    t.string "med_certification_exp_date"
    t.string "med_waiver_effective_date"
    t.string "med_waiver_exp_date"
    t.string "med_spe_effective_date"
    t.string "med_spe_exp_date"
    t.string "med_ex_last_name"
    t.string "med_ex_first_name"
    t.string "med_ex_middle_name"
    t.string "med_ex_suffix_name"
    t.string "med_ex_last_trunc"
    t.string "med_ex_first_trunc"
    t.string "med_ex_middle_trunc"
    t.string "med_ex_license_num"
    t.string "med_ex_reg_num"
    t.string "med_ex_spec_code"
    t.string "med_ex_tel_code"
    t.string "med_ex_jurasdiction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "muid"
  end

  create_table "missouri_data", force: :cascade do |t|
    t.string "parsed_timestamp"
    t.string "file_small"
    t.string "file_large"
    t.boolean "new_file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "muids", force: :cascade do |t|
    t.string "muid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
