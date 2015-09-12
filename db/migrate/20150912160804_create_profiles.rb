class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :realname
      t.string :id_no
      t.string :sex
      t.string :mobile
      t.date :birth_day
      t.date :death_day
      t.string :address
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
