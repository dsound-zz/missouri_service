class RemoveTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :action_records
    drop_table :basic_data_records 
    drop_table :bulk_files
    drop_table :license_issuance_records
    drop_table :medical_cert_records
    drop_table :muids
  end
end
