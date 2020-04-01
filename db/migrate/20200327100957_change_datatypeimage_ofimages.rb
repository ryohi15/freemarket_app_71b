class ChangeDatatypeimageOfimages < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :image, :string
  end
end
