class CreateNotaryRelateds < ActiveRecord::Migration
  def change
    create_table :notary_relateds do |t|
      t.string :has_crime_record
      t.string :has_testament
      t.integer :archive_id
      t.boolean :updated_once, default: false
      t.string :crime_record_file
      t.string :testament_file
      t.text :crime_record_comment

      t.timestamps null: false
    end
  end
end
