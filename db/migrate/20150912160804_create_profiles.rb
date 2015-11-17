class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :realname, default: ''
      t.string :id_no, default: ''
      t.string :sex
      t.string :mobile
      t.date :birth_day
      t.date :death_day
      t.string :address
      t.integer :archive_id
      t.string :email
      t.string :marry_status
      t.boolean :updated_once, default: false

      t.timestamps null: false
    end
  end
end
