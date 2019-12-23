class CreateMedicalCertRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_cert_records do |t|
    
      t.string :med_certification_status
      t.string :med_self_certification_code
      t.string :med_restriction_codes
      t.string :med_certification_issue_date
      t.string :med_certification_exp_date
      t.string :med_waiver_effective_date
      t.string :med_waiver_exp_date 
      t.string :med_spe_effective_date
      t.string :med_spe_exp_date
      t.string :med_ex_last_name
      t.string :med_ex_first_name 
      t.string :med_ex_middle_name 
      t.string :med_ex_suffix_name
      t.string :med_ex_last_trunc
      t.string :med_ex_first_trunc 
      t.string :med_ex_middle_trunc
      t.string :med_ex_license_num
      t.string :med_ex_reg_num
      t.string :med_ex_spec_code
      t.string :med_ex_tel_code
      t.string :med_ex_jurasdiction 

      t.timestamps
    end
  end
end
