class AddAvatarToArchives < ActiveRecord::Migration
  def change
    add_column :archives, :avatar, :string
  end
end
