class AddColumnMuidToLicenseIssuanceRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :license_issuance_records, :muid, :string 
  end
end
