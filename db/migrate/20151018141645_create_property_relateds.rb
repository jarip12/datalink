class CreatePropertyRelateds < ActiveRecord::Migration
  def change
    create_table :property_relateds do |t|
      t.boolean :updated_once, default: false
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
