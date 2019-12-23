class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :muid
      t.string :license
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :suffix
      t.string :first_nm_t
      t.string :last_name_t
      t.string :middle_name_t
      t.string :dob
      t.string :sex
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :street_updated
      t.string :city_updated
      t.string :state_updated
      t.string :zip_updated
      t.string :heigh
      t.string :weight
      t.string :eyes
      t.string :op_status
      t.string :comm_status
      t.string :shcool_bus_status
      t.string :pending_activity_code
      t.string :must_test
      t.string :deceased
      t.string :previous_cdl
      t.string :cdl_pointer
      t.string :pdps_pointer
      t.string :mvr_privacy_code
      t.string :brc_status_code
      t.string :brc_status_date

      t.timestamps
    end
  end
end
