class AddIndexs < ActiveRecord::Migration
  def change
    add_index :profiles, :id_no
    add_index :profiles, :realname

    add_index :reservations, :reserve_at
  end
end
