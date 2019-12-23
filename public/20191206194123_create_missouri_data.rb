class CreateMissouriData < ActiveRecord::Migration[6.0]
  def change
    create_table :missouri_data do |t|
      t.string :parsed_timestamp
      t.string :file_small
      t.string :file_large
      t.boolean :new_file

      t.timestamps
    end
  end
end
