class CreateNotaryForeignTables < ActiveRecord::Migration
  def change
    create_table :notary_foreign_tables do |t|
      t.string :realname
      t.integer :sex
      t.integer :age
      t.integer :id_no
      t.string :use_country
      t.text :now_address

      t.text :before_abroad_address
      t.date :abroad_day

      t.string :notary_type
      t.string :notary_type_info
      t.string :translate_lang
      t.string :email
      t.string :mobile
      t.integer :file_num
      t.boolean :require_notary, default: true
      t.integer :photo_num
      t.text :work_unit

      t.date :birth_day
      t.text :comment
      t.string :agent_name
      t.string :agent_relation
      t.string :agent_mobile
      t.text :agent_address
      t.string :sync_status
      t.string :purpose
      t.integer :user_id

      t.string :notary_use
      t.string :reserve_day
      t.string :reserve_hour

      t.integer :notary_record_id
      t.boolean :user_verified, default: false
      t.datetime :reserve_at

      t.timestamps null: false
    end
  end
end
