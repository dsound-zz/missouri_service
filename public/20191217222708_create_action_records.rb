class CreateActionRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :action_records do |t|
      t.string :action_type
      t.string :action_case
      t.string :action_effective_date
      t.string :action_eligible_reinstate_date
      t.string :action_status_code
      t.string :action_status_date
      t.string :action_state_offense
      t.string :action_offense_date
      t.string :action_ticket_num
      t.string :action_hazmat_ind
      t.string :action_state 
      t.string :action_out_state_eval
      t.string :action_acd_code
      t.string :wd_type_code
      t.string :wd_basis_code 
      t.string :wd_due_proc_code 
      t.string :wd_ext_code 
      t.string :wd_ref_num 
      t.string :action_cdl_holder 
      t.string :wd_id 
      t.string :wd_bac_level 
    
      t.timestamps
    end
  end
end
