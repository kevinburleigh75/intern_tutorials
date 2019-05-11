class AddJunkRecordsNameUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :junk_records, :name, unique: true
  end
end
