class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.date :start_day
      t.date :end_day
      t.string :notary_type
      t.string :description
      t.float :amount
      t.integer :archive_id
      t.boolean :repay_on_time

      t.timestamps null: false
    end
  end
end
