class CreateLicenseIssuanceRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :license_issuance_records do |t|
      t.string :license_issuance_code
      t.string :license_class
      t.string :license_expiration_date
      t.string :license_sequential_number
      t.string :license_surrendered_missouri
      t.string :license_surrendered_to
      t.string :license_num_former_driver
      t.string :license_endorsemnts
      t.string :license_restrictions
      t.string :license_transaction_type
      t.string :license_printed_data
      t.string :permit_code
      t.string :permit_class
      t.string :permit_expiration_date
      t.string :permit_seq_num
      t.string :permit_endorsement_codes
      t.string :permit_restriction_codes
      t.string :permit_transaction_type
      t.string :permit_printed_date
      t.string :non_driver_issue_code
      t.string :non_driver_exp_date
      t.string :non_driver_seq_num
      t.string :non_driver_trans_type
      t.string :non_driver_print_date
      
      t.timestamps
    end
  end
end
