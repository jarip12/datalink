class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.date :deposit_day
      t.date :receive_day
      t.float :amount
      t.integer :archive_id

      t.timestamps null: false
    end
  end
end
