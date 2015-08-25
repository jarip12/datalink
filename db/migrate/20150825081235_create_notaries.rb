class CreateNotaries < ActiveRecord::Migration
  def change
    create_table :notaries do |t|
      t.string :no
      t.string :notary_type

      t.timestamps null: false
    end
  end
end
