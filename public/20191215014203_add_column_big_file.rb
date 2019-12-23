class AddColumnBigFile < ActiveRecord::Migration[6.0]
  def change
    remove_column :big_files, :each_record, :string
  end
end
