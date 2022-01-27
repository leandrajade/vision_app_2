class AddBoughtToGallery < ActiveRecord::Migration[6.1]
  def change
    add_column :galleries, :bought, :boolean, default: false
  end
end
