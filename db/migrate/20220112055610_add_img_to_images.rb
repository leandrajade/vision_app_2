class AddImgToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :img, :string
  end
end
