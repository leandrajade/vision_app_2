class AddPictureToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :picture, :string
  end
end
