class CreateForeignTables < ActiveRecord::Migration
  def change
    create_table :foreign_tables do |t|
      t.string :realname
      t.integer :age
      t.date :birth_day
      t.string :company_location
      t.string :residence
      t.string :paperwork_name
      t.string :paperwork_no
      t.string :apply_context
      t.string :proxy_people_name
      t.date :apply_date
      t.datetime :reserve_at

      t.timestamps null: false
    end
  end
end
