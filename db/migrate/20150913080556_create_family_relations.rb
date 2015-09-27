class CreateFamilyRelations < ActiveRecord::Migration
  def change
    create_table :family_relations do |t|
      t.string :id_no
      t.string :realname
      t.string :relation_name
      t.integer :owner_archive_id
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
