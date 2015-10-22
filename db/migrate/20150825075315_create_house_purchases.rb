class CreateHousePurchases < ActiveRecord::Migration
  def change
    create_table :house_purchases do |t|
      t.date :trade_day
      t.string :trade_type
      t.string :house_type
      t.string :house_address
      t.float :house_amount
      t.integer :property_related_id

      t.timestamps null: false
    end
  end
end
