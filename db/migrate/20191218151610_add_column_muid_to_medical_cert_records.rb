class AddColumnMuidToMedicalCertRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_cert_records, :muid, :string
  end
end
