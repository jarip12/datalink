class CreateHousePurchases < ActiveRecord::Migration
  def change
    create_table :house_purchases do |t|
      t.date :trade_date
      t.string :trade_type
      t.string :house_type
      t.string :house_address
      t.string :house_amount
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
