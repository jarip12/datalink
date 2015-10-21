class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :notary_table_id
      t.string :notary_table_type

      t.string :status

      t.datetime :reserve_at

      t.timestamps null: false
    end
  end
end
