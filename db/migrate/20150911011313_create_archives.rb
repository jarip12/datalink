class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :realname
      t.string :id_no
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
