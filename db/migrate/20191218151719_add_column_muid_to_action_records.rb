class AddColumnMuidToActionRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :action_records, :muid, :string
  end
end
