class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.date :deposit_day
      t.date :receive_day
      t.float :amount
      t.integer :property_related_id
      t.boolean :updated_once, default: false
      t.string :scan_file

      t.timestamps null: false
    end
  end
end
