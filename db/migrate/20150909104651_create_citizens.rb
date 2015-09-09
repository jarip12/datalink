class CreateCitizens < ActiveRecord::Migration
  def change
    create_table :citizens do |t|
      t.string :id_no
      t.string :realname

      t.timestamps null: false
    end
  end
end
