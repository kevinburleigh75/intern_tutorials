class CreateJunkRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :junk_records do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
