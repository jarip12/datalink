class CreateFamilyRelations < ActiveRecord::Migration
  def change
    create_table :family_relations do |t|
      t.string :id_no
      t.string :realname
      t.string :relation_name
      t.integer :owner_archive_id
      t.integer :family_related_id
      t.boolean :updated_once, default: false

      t.timestamps null: false
    end
  end
end
