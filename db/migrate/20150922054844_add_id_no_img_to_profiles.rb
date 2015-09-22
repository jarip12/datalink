class AddIdNoImgToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :id_no_img, :string
  end
end
