class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :notary_table_id
      t.string :notary_table_type
      t.integer :archive_id

      t.string :status
      t.integer :user_id
      t.string :sync_user_verified, default: false

      t.datetime :reserve_at

      t.timestamps null: false
    end
  end
end
