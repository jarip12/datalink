class CreateFamilyRelations < ActiveRecord::Migration
  def change
    create_table :family_relations do |t|
      t.integer :my_id
      t.string :relation_name
      t.string :relation_id_card

      t.timestamps null: false
    end
  end
end
