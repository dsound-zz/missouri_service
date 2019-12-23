class CreateBigFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :big_files do |t|
      t.string :file

      t.timestamps
    end
  end
end
