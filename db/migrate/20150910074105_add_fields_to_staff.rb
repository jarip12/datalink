class AddFieldsToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :role, :string
    add_column :staffs, :realname, :string
  end
end
