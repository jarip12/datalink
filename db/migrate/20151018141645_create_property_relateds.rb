class CreatePropertyRelateds < ActiveRecord::Migration
  def change
    create_table :property_relateds do |t|
      t.boolean :updated_once
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
