class CreateFakerMaterials < ActiveRecord::Migration
  def change
    create_table :faker_materials do |t|
      t.string :faker_material_no
      t.string :faker_material_type
      t.integer :notary_related_id

      t.timestamps null: false
    end
  end
end
