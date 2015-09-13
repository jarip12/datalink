class CreateNotaryRelateds < ActiveRecord::Migration
  def change
    create_table :notary_relateds do |t|
      t.boolean :has_crime_record, default: false
      t.boolean :has_testament, default: false
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
