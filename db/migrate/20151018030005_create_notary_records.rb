class CreateNotaryRecords < ActiveRecord::Migration
  def change
    create_table :notary_records do |t|
      t.string :notary_type
      t.string :notary_id
      t.integer :user_id
      t.integer :archive_id
      t.integer :notary_related_id
      t.integer :reservation_id
      t.integer :notary_related_id
      t.string :scan_file
      t.boolean :synced, default: false

      t.timestamps null: false
    end
  end
end
