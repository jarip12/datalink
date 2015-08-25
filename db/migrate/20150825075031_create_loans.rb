class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.date :start_day
      t.date :end_day
      t.string :loan_type
      t.string :description
      t.float :amount
      t.boolean :repay_on_time

      t.timestamps null: false
    end
  end
end
