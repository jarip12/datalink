class CreateNotaryRecords < ActiveRecord::Migration
  def change
    create_table :notary_records do |t|
      t.string :notary_type
      t.string :notary_id
      t.integer :user_id
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
