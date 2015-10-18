class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.string :notary_type
      t.string :status
      t.datetime :reserve_at

      t.timestamps null: false
    end
  end
end
