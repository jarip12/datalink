class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :realname, :string
    add_column :users, :id_no, :string
    add_column :users, :sex, :string
    add_column :users, :mobile, :string
    add_column :users, :birth_daty, :date
    add_column :users, :death_daty, :date
    add_column :users, :address, :string
    add_column :users, :verified, :boolean, default: false
  end
end
