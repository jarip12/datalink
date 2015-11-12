class CreateFamilyRelateds < ActiveRecord::Migration
  def change
    create_table :family_relateds do |t|
      t.boolean :updated_once, default: false
      t.integer :archive_id
      t.boolean :synced, default: false
      t.timestamps null: false
    end
  end
end
