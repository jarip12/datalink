class CreateNotaryRelateds < ActiveRecord::Migration
  def change
    create_table :notary_relateds do |t|
      t.boolean :has_crime_record, default: false
      t.boolean :has_testament, default: false
      t.integer :archive_id
      t.boolean :updated_once, default: false
      t.string :crime_record_file
      t.string :testament_file
      t.text :crime_record_comment

      t.timestamps null: false
    end
  end
end
