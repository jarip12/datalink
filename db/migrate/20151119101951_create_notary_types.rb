class CreateNotaryTypes < ActiveRecord::Migration
  def change
    create_table :notary_types do |t|
      t.string :type_name
      t.integer :notary_foreign_table_id
      t.string :type_info

      t.timestamps null: false
    end
  end
end
