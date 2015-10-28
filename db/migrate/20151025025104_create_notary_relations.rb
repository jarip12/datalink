class CreateNotaryRelations < ActiveRecord::Migration
  def change
    create_table :notary_relations do |t|
      t.string :relation
      t.string :realname
      t.string :english_name
      t.string :sex
      t.date :birth_day
      t.text :now_address
      t.text :before_abroad_address
      t.integer :notary_foreign_table_id

      t.timestamps null: false
    end
  end
end
